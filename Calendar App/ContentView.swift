//
//  ContentView.swift
//  Calendar App
//
//  Created by Kapil Bhattarai on 09/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextName(cityName: "Kathmandu, NP")
                MainWeatherView(image: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                Spacer()
                HStack(spacing: 12) {
                    WeatherDayView(dayOfTheWeek: "SUN", image: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfTheWeek: "MON", image: "wind.snow", temperature: 46)
                    WeatherDayView(dayOfTheWeek: "TUE", image: "tornado", temperature: 26)
                    WeatherDayView(dayOfTheWeek: "WED", image: "smoke.fill", temperature: 16)
                    WeatherDayView(dayOfTheWeek: "THU", image: "cloud.moon.fill", temperature: 25)
                    WeatherDayView(dayOfTheWeek: "FRI", image: "cloud.moon.rain.fill", temperature: 19)
                    WeatherDayView(dayOfTheWeek: "SAT", image: "snow", temperature: 17)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Change to Light Theme" : "Change to Dark Theme", foreGroundColor: .blue, backGroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfTheWeek: String
    var image: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextName: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var image: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 76, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 20)
    }
}

struct WeatherButton: View {
    var title: String
    var foreGroundColor: Color
    var backGroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backGroundColor)
            .foregroundColor(foreGroundColor)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(10)
    }
}

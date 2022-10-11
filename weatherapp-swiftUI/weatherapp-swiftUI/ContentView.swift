//
//  ContentView.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/10/22.
//

import SwiftUI

//struct WeatherArrData: Codable {
//    var id: Int
//    var main: String
//    var description: String
//    var icon: String
//}
//struct TempObjData: Codable {
//    var temp: String
//    var feels_like: String
//    var temp_main: String
//    var temp_min: String
//    var temp_max: String
//    var pressure: String
//    var humidity: String
//}
//struct WeatherData: Codable {
//    var weather: Array<WeatherArrData>
//    var main: TempObjData
//}
struct ContentView: View {
    
    @State private var isNight = false
//    @State private var weatherData : String = ""
//    @State private var tempData : String = ""
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Los Angeles, CA")
                MainWeatherStatusView(tempData: isNight ? "60" : "79" , weatherImg: isNight ? "cloud.moon.fill" :  "sun.haze.fill" )
                HStack(spacing: 30){

                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.haze.fill", temp: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temp: 80)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temp: 85)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "thermometer.sun.fill", temp: 94)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temp: 76)
                }
                Spacer()
                Button{
                    isNight.toggle()
                    Task{
          
                      
                    }
                }label: {
                    WeatherButtonView( textColor: .blue, backgroundColor: .white, title: "Change Daytime")
                }
             
                Spacer()
          
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 26, weight: .light, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
            colors: [isNight ? .black : .indigo,
                     isNight ? .indigo: Color("lightblue")
                    ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct CityTextView: View{
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .frame(width: 200, height: 200)
            .padding(.top)
    }
}

struct MainWeatherStatusView: View{
//    @Binding var tempData: String
    var tempData: String
    var weatherImg: String
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: weatherImg)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 170, height: 170)
            Text("\(tempData)º")
                .font(.system(size: 70, weight: .light, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}


//func getForecast() {
//    var WeatherData: String
//    var TempData: String
//
//    if let clientID = ProcessInfo.processInfo.environment["API_KEY"]{
//        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Los Angeles)&units=imperial&appid=\(clientID)")!)
//        let decodedResponse = try? JSONDecoder().decode(WeatherData.self, from: data)
//        weatherData = decodedResponse?.weather[0].main ?? ""
//        tempData = decodedResponse?.main.temp ?? ""
//
//    }
//
//}



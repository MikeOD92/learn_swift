//
//  ContentView.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/10/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isNight = false
    @StateObject var viewModel = ViewModel()
//    let tempData = viewModel.data.main?.temp
    


    var body: some View {
        
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Los Angeles, CA")
                MainWeatherStatusView(tempData: viewModel.data, weatherImg: isNight ? "cloud.moon.fill" :  "sun.haze.fill")
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
                        viewModel.fetch()
                    }
                }label: {
                    WeatherButtonView( textColor: .blue, backgroundColor: .white, title: "Change Daytime")
                }
             
                Spacer()
          
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            viewModel.fetch()
        }
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
    var tempData: Response
    var weatherImg: String
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: weatherImg)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 170, height: 170)
            Text("\(String(format: "%.1f", tempData.main.temp))º")
                .font(.system(size: 70, weight: .light, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}




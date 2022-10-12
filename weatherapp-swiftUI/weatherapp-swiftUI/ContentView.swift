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
                    
                    ForEach(viewModel.data.list, id: \.self){
                        datapoint in
                        WeatherDayView(dayOfWeek: datapoint.dt_txt, temp: datapoint)
                    }
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
            if 0 < tempData.list.count {
                Text("\(String(format: "%.1f", tempData.list[0].main.temp))º")
                    .font(.system(size: 70, weight: .light, design: .default))
                    .foregroundColor(.white)

            }
        }.padding(.bottom, 40)
    }
}




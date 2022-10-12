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
                    .padding(.top)
                MainWeatherStatusView(tempData: viewModel.data)
                
                ZStack{
                    VStack{
                        Text("Hourly Forcast: ")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 20, alignment: .leading)
                            .padding(.top)
                        ScrollView(.horizontal){
                            HStack(spacing: 30){
                                ForEach(viewModel.data.list, id: \.self){
                                    datapoint in
                                    WeatherDayView(dayOfWeek: datapoint.dt_txt, temp: datapoint)
                                }
                            }.padding()
                        }
                    }
                        .frame(width:300, height:150)
                        .padding()
                }
                .background(isNight ? Color(UIColor.systemIndigo).opacity(0.35) : Color(UIColor.white).opacity(0.2))
                ScrollView(.vertical){
                    // vertical stack for daily forcast need to make seprate view
                    VStack{
                        Text("10 Day forcast")
                        HStack{
                            Text("TUE")
                            Text("Low: 50°")
                            Text("High: 70°")
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
                    }
                    }
                    
          
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
            .frame(width: 300, height: 100)
            .padding(.top)
    }
}

struct MainWeatherStatusView: View{
    var tempData: Response
   
    var body: some View{
        VStack{
            if 0 < tempData.list.count {
                Text("\(String(format: "%.1f", tempData.list[0].main.temp))º")
                    .font(.system(size: 70, weight: .light, design: .default))
                    .foregroundColor(.white)
                Text(tempData.list[0].weather[0].description)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(.white)
                HStack{
                    Text("H: \(String(format: "%.0f", tempData.list[0].main.temp_max))°")
                        .font(.system(size: 20, weight: .light, design: .default))
                        .foregroundColor(.white)
                    Text("L: \(String(format: "%.0f", tempData.list[0].main.temp_min))°")
                        .font(.system(size: 20, weight: .light, design: .default))
                        .foregroundColor(.white)
                }
            }
        }.padding(.bottom, 40)
    }
}




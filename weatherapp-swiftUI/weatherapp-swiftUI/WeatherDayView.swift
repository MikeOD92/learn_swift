//
//  WeatherDayView.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/12/22.
//

import Foundation
import SwiftUI

struct WeatherDayView: View {
    var dayOfWeek: String
//    var imageName: String
    var temp: DataPoints
    
    var body: some View {
        VStack{
            Text((dayOfWeek.split(separator: " ")[1].split(separator: ":")[0]) + ":" + (dayOfWeek.split(separator: " ")[1].split(separator: ":")[1]))
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            if Int(dayOfWeek.split(separator: " ")[1].split(separator: ":")[0]) ?? 0 > 18
                || Int(dayOfWeek.split(separator: " ")[1].split(separator: ":")[0]) ?? 0 < 6 {
                switch(temp.weather[0].main){
                    case "Rain":
                        Image(systemName: "cloud.rain")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    case "Cloudy":
                        Image(systemName: "cloud")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    default:
                        Image(systemName: "moon.stars.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                }
            }else{
                switch(temp.weather[0].main){
                    case "Rain":
                        Image(systemName: "cloud.rain.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    case "Cloudy":
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    default:
                        Image(systemName: "sun.max.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                }
            }

            Text("\(String(format: "%.0f", temp.main.temp))°")
                .font(.system(size: 26, weight: .light, design: .default))
                .foregroundColor(.white)
        }
    }
}

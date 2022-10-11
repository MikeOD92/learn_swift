//
//  ViewModel.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/11/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var data : Response = Response(coord: CordObj(lon: 0, lat: 0),
                                              weather: [],
                                              base: "",
                                              main: MainObj(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0 , pressure: 0, humidity: 0),
                                              visibility: 0,
                                              wind: WindObj(speed: 0, deg: 0) ,
                                              clouds: CloudObj(all: 0),
                                              dt: 0,
                                              sys: SysObj(type: 0, id: 0, country: "", sunrise: 0, sunset: 0),
                                              timezone: 0, id: 0, name: "", cod: 0)
    
    func fetch(){
        let baseurl : String = "https://api.openweathermap.org/data/2.5/weather?q=Los%20Angeles&units=imperial&appid="
        let apiToken : String = "\(ProcessInfo.processInfo.environment["API_KEY"] ?? "" )"
            guard let url = URL(string: baseurl + apiToken)
            else {
                print("returning here")
                return
            }
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _,
                error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let weatherData = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self?.data = weatherData
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

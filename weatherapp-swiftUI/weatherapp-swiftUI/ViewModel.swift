//
//  ViewModel.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/11/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var data : Response = Response(cod: "",
                                              message: 0,
                                              cnt: 0,
                                              list:[],
                                              city: CityObj(id: 0, name: "", coord: CordObj(lon: 0, lat: 0), country: "", population: 0, timezone: 0, sunrise: 0, sunset: 0)
                                                )
    
    func fetch(){
        let baseurl : String = "https://api.openweathermap.org/data/2.5/forecast?q=Los%20Angeles&cnt=5&units=imperial&appid="
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
//                    print(weatherData.list[0].main)
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

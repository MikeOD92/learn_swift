//
//  ResponseModel.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/11/22.
//

import Foundation
import SwiftUI

struct CordObj: Codable {
    let lon: Double
    let lat: Double
    
    init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

struct WeatherObj: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(id: Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
struct MainObj: Codable {
    let temp:  Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    
    init(temp: Double, feels_like: Double, temp_min: Double, temp_max: Double, pressure: Int, humidity: Int) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.humidity = humidity
    }
}
struct WindObj: Codable {
    let speed: Double
    let deg: Int
    
    init(speed: Double, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
}
struct CloudObj: Codable {
    let all: Int
    
    init(all: Int) {
        self.all = all
    }
}
struct SysObj: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
    
    init(type: Int, id: Int, country: String, sunrise: Int, sunset: Int) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
struct Response: Codable {
    let coord: CordObj
    let weather: [WeatherObj]
    let base: String
    let main: MainObj
    let visibility: Int
    let wind: WindObj
    let clouds: CloudObj
    let dt: Int
    let sys: SysObj
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
}

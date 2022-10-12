//
//  ResponseModel.swift
//  weatherapp-swiftUI
//
//  Created by Michael O'Dell on 10/11/22.
//

import Foundation
import SwiftUI

struct CordObj: Hashable, Codable {
    let lon: Double
    let lat: Double
    
    init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

struct WeatherObj: Hashable, Codable {
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
struct MainObj: Hashable, Codable {
    let temp:  Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let sea_level: Int
    let grnd_level: Int
    let humidity: Int
    let temp_kf: Double
    
    init(temp: Double, feels_like: Double, temp_min: Double, temp_max: Double, pressure: Int, sea_level: Int, grnd_level: Int, humidity: Int, temp_kf: Double) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.sea_level = sea_level
        self.grnd_level = grnd_level
        self.humidity = humidity
        self.temp_kf = temp_kf
    }
}
struct WindObj: Hashable, Codable {
    let speed: Double
    let deg: Int
    let gust: Double
    
    init(speed: Double, deg: Int, gust: Double) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}
struct CloudObj: Hashable, Codable {
    let all: Int
    
    init(all: Int) {
        self.all = all
    }
}
struct SysObj: Hashable, Codable {
    let pod: String
    
    init(pod: String) {
        self.pod = pod
    }
}
struct CityObj: Hashable, Codable {
    let id: Int
    let name: String
    let coord: CordObj
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
    
    init(id: Int, name: String, coord: CordObj, country: String, population: Int, timezone: Int, sunrise: Int, sunset: Int) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
struct DataPoints: Hashable, Codable {
    let dt: Int
    let main: MainObj
    let weather: [WeatherObj]
    let clouds: CloudObj
    let wind: WindObj
    let visibility: Int
    let sys: SysObj
    let dt_txt: String
    
    init(dt: Int, main: MainObj, weather: [WeatherObj], clouds: CloudObj, wind: WindObj, visibility: Int, sys: SysObj, dt_txt: String) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.sys = sys
        self.dt_txt = dt_txt
    }
}
struct Response: Hashable, Codable {
    let cod : String
    let message: Int
    let cnt: Int
    let list: [DataPoints]
    let city: CityObj
    
    init(cod: String, message: Int, cnt: Int, list: [DataPoints], city: CityObj) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}

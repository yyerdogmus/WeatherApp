//
//  City.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 31.10.2022.
//

import Foundation


final class City {
     var lat: String?
     var lon: String?
     var cityName: String?
    var temp: String?
    var feelsLike: String?
    var humidity: String?
    var pressure: String?
    
    init(lat: String? = nil, lon: String? = nil, cityName: String? = nil, temp: String? = nil, feelsLike: String? = nil, humidity: String? = nil, pressure: String? = nil) {
        self.lat = lat
        self.lon = lon
        self.cityName = cityName
        self.temp = temp
        self.feelsLike = feelsLike
        self.humidity = humidity
        self.pressure = pressure
    }
}


var cities = [
    City(lat: "41.10795624437255", lon: "29.032269082641236", cityName: "İstanbul"),
    City(lat: "39.86631711237407", lon: "32.7383838549023", cityName: "Ankara"),
    City(lat: "37.781226210760785", lon: "-122.39339425793241", cityName: "San Francisco"),
    City(lat: "50.11089040289464", lon: "8.672883151638299", cityName: "Frankfurt"),
    City(lat: "50.11204793991145", lon: "8.669286303010479", cityName: "Shanghai")
]

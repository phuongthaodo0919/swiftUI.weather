//
//  GetWeatherViewModel.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import Foundation

struct WeatherViewModel {
    
    let weather: Weather
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }
    
    let id = UUID()
    
    var temperature: Double {
        weather.temperature
    }
    
    var city: String {
        weather.city
    }
    
    var icon: String {
        weather.icon
    }
    
    var sunrise: String {
        dateFormatter.string(from: weather.sunrise)
    }
    
    var sunset: String {
        dateFormatter.string(from: weather.sunset)
    }
}

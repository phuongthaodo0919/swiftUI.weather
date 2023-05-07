//
//  WeatherResponse.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    var weather: Weather
    var icon: [WeatherIcon]
    var sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case nameKey = "name"
        case weatherKey = "main"
        case iconKey = "weather"
        case sunSysKey = "sys"
    }
    
    enum WeatherKeys: String, CodingKey {
        case temperatureKey = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        icon = try container.decode([WeatherIcon].self, forKey: .iconKey)
        sys = try container.decode(Sys.self, forKey: .sunSysKey)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weatherKey)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperatureKey)
        
        name = try container.decode(String.self, forKey: .nameKey)
        
        weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
    }
}
struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date
    
    private enum CodingKeys: String, CodingKey {
        case sunriseKey = "sunrise"
        case sunsetKey = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseInterval = try container.decode(Int32.self, forKey: .sunriseKey)
        let sunsetInterval = try container.decode(Int32.self, forKey: .sunsetKey)
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseInterval))
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetInterval))
    }
    
}

struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
}

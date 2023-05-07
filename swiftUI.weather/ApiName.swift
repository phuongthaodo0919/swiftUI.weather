//
//  ApiName.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import Foundation

struct ApiInfo {
    private let ENDPOINT: String = "https://api.openweathermap.org/data/2.5/weather"
    
    private let API_KEY: String = "f8ee34105bdc2a45556a54b460269e03"
    
    var weather_enpoint: String {
        return "\(ENDPOINT)?appid=\(API_KEY)"
    }
    
    //https://api.openweathermap.org/data/2.5/weather?q=London&limit=5&appid=f8ee34105bdc2a45556a54b460269e03
}



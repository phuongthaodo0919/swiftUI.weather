//
//  AddWeatherViewModel.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    var city: String = ""
    
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        WeatherService().getWeather(city: self.city) { weather in
            if let weather {
                completion(WeatherViewModel(weather: weather))
            } else {
                print("Could not get data")
            }
        }
    }
}

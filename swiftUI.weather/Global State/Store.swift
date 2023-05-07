//
//  Store.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/7/23.
//

import Foundation

class Store: ObservableObject {
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}

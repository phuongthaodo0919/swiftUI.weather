//
//  WeatherService.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> Void ){
        let urlStr = "\(ApiInfo().weather_enpoint)&q=\(city)"
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data, err == nil else {
                completion(nil)
                return
            }
            do {
                let dataDecoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(dataDecoded.weather)
            } catch {
                completion(nil)
                return
            }
        }.resume()
    }
}

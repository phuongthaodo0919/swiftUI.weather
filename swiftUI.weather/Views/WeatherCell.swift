//
//  WeatherCell.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/7/23.
//

import SwiftUI

struct WeatherCell: View {
    var weatherVM: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(weatherVM.city)
                    .font(.custom("Arial", size: 25))
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text(weatherVM.sunrise)
                }
                HStack {
                    Image(systemName: "sunset")
                    Text(weatherVM.sunset)
                }
            }
            Spacer()
            Text("\(Int(weatherVM.temperature)) K")
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .padding(20)
        .background(Color(uiColor: UIColor(red: 1.00, green: 0.97, blue: 0.87, alpha: 1.00)))
        .cornerRadius(20)
    
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(weatherVM: WeatherViewModel(weather: Weather(city: "H", temperature: 12.0, icon: "", sunrise: Date(), sunset: Date())))
        
    }
                                       
                    
    }

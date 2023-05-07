//
//  AddWeatherView.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import SwiftUI

struct AddWeatherView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @EnvironmentObject var store: Store
    @State private var addweatherVM = AddWeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Enter city", text: $addweatherVM.city)
                        .textFieldStyle(.roundedBorder)
                    Button("Add weather") {
                        addweatherVM.save { weatherVM in
                            store.addWeather(weatherVM)
                            presentationMode.wrappedValue.dismiss()
                        }
                            
                    }
                    .padding()
                    .background(Color(uiColor: UIColor(red: 0.62, green: 0.44, blue: 0.13, alpha: 1.00)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(20)
                .background(Color(uiColor: UIColor(red: 1.00, green: 0.97, blue: 0.87, alpha: 1.00)))
                .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add city")
        }
        
    }
}

struct AddWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        AddWeatherView().environmentObject(Store())
    }
}

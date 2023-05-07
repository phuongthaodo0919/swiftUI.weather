//
//  WeatherListView.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import SwiftUI
enum Sheet: Identifiable {
    var id: UUID {
        return UUID()
    }
    case addNewCity
    case setting
}

struct ListWeatherView: View {
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheet?
    
    var body: some View {
        NavigationView {
            List{
                ForEach(store.weatherList, id: \.id) { item in
                   WeatherCell(weatherVM: item)
                }
            }
            .navigationTitle("Cities")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.activeSheet = Sheet.setting
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.activeSheet = Sheet.addNewCity
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .sheet(item: $activeSheet) { item in
                switch item {
                case .addNewCity:
                    AddWeatherView().environmentObject(store)
                case .setting:
                    SettingWeatherView()
                }
            }
        }
    }
}

struct ListWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ListWeatherView().environmentObject(Store())
    }
}

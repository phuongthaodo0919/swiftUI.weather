//
//  swiftUI_weatherApp.swift
//  swiftUI.weather
//
//  Created by Salmdo on 5/5/23.
//

import SwiftUI

@main
struct swiftUI_weatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}

//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherListScreen()
                .environmentObject(Store())
        }
    }
}

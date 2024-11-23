//
//  Store.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation

class Store: ObservableObject {
    
    @Published var weatherList: [Forecast] = [Forecast]()
    
    func addWeather(_ weather: Forecast) {
        weatherList.append(weather)
    }
    
}


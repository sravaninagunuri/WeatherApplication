//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation
struct WeatherModel {
    
    let weather: Forecast
    
    let id = UUID()
    
    var dt: Int {
        weather.dt
    }
    var main: Main {
        weather.main
    }
    
    var wind: Wind {
        weather.wind
    }
    var dtTxt: String {
        weather.dtTxt
    }
    
}

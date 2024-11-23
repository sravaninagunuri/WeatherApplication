//
//  Weather.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation

// MARK: - Root Model
struct WeatherForecast: Decodable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
    let city: City
}

// MARK: - Forecast Details
struct Forecast: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case wind
        case dtTxt = "dt_txt"
    }
}

// MARK: - Main Weather Data
struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

// MARK: - Weather Conditions
struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Wind Data
struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

// MARK: - City Details
struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coordinates
    let country: String
    let population: Int
}

// MARK: - Coordinates
struct Coordinates: Decodable {
    let lat: Double
    let lon: Double          
}

//
//  Location.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/23/24.
//


struct Location: Decodable {
    let name: String
    let localNames: [String: String]?
    let lat: Double
    let lon: Double
    let country: String
    let state: String?        
    
    // Map JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat
        case lon
        case country
        case state
    }
}

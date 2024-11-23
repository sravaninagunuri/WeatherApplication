//
//  Constants.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation

struct Constants {
    struct Urls {
        static func weatherForCity(longitude: Double, latitude: Double) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&cnt=3&appid=e83893739328a2d3b1bdffa6844c383d")
            
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}

//
//  WebService.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation
import CoreLocation
import UIKit


enum NetworkError: Error {
    case badURL
    case noData
}

class WebService {
    
    func getWeatherByLocation(longitude: Double, latitude: Double, completion: @escaping ((Result<WeatherForecast, NetworkError>) -> Void)) {
        
        guard let weatherURL = Constants.Urls.weatherForCity(longitude: longitude, latitude: latitude) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherForecast.self, from: data)
            
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse))
                print(weatherResponse)
            }
            
        }.resume()
    }
    
}

extension WebService {

    func getCoordinates(for city: String, state: String, country: String, completion: @escaping (Location, Error?) -> Void) {
        
        let urlString = "https://api.openweathermap.org/geo/1.0/direct?q=\(city),\(state),\(country)&limit=5&appid=e83893739328a2d3b1bdffa6844c383d"

        // Create the URL object
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // Create the URLRequest object
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // OpenWeatherMap Geocoding API uses GET

        // Make the API call using URLSession
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Check the HTTP response status
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    print("API call failed with status code: \(httpResponse.statusCode)")
                    return
                }
            }
            
            if let data = data {
                    do {
                        let locations = try JSONDecoder().decode([Location].self, from: data)
                        
                        for location in locations {
                            print("City: \(location.name), Latitude: \(location.lat), Longitude: \(location.lon)")
                            completion(location, error)
                        }
                    } catch {
                        print("Failed to decode JSON: \(error.localizedDescription)")
                    }
                }
        }

        task.resume()
    }

}

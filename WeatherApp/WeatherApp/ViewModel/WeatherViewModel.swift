//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    var city: String = ""
    var state: String = ""
    var country: String = ""
    
    func save(completion: @escaping (WeatherForecast) -> Void) {
        
        //get city, state,country names from city string
        
        var cityComponents = city.components(separatedBy: ",")
        
        if cityComponents.count == 1 {
            state = "TS"
            country = "India"
        }
        WebService().getCoordinates(for: cityComponents[0], state: cityComponents[1], country: cityComponents[2]) { coordinates, error in
            if let error = error {
                print("Failed to get coordinates: \(error.localizedDescription)")
            } else  {
                WebService().getWeatherByLocation(longitude: coordinates.lon, latitude: coordinates.lat) { result in
                    switch result {
                        case .success(let weatherForeCastModel):
                            DispatchQueue.main.async {
                                completion(weatherForeCastModel)
                            }
                        case .failure(let error):
                            print(error)
                    }
                }
            } 
        }
        
    }
    
}

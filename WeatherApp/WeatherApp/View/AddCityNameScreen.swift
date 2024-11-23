//
//  AddCityNameScreen.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import SwiftUI

struct AddCityNameScreen: View {
    @StateObject var weatherViewModel =  WeatherViewModel()
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        
        NavigationStack {
            VStack {
                VStack(spacing: 20) {
                    TextField("Enter city Name,state,country", text: $weatherViewModel.city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        // save weather in environment object
                        weatherViewModel.save { weather in
                            
                            
                            for list in weather.list {
                                store.addWeather(list)
                            }
                           
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    }.padding(10)
                        .frame(maxWidth: UIScreen.main.bounds.width/4)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }.padding()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                Spacer()
            }.padding()
            
                .navigationTitle("Add City")

        }
    }
}

#Preview {
    AddCityNameScreen()
}

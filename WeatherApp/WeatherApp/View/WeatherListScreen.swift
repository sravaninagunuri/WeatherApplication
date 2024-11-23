//
//  WeatherListScreen.swift
//  WeatherApp
//
//  Created by Sravani Nagunuri on 11/22/24.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
}

struct WeatherListScreen: View {

    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(store.weatherList, id: \.dt) { weather in
                    WeatherCell(weather: weather)
                }
                
            }
            .listStyle(PlainListStyle())
            
            .sheet(item: $activeSheet, content: { (item) in
                switch item {
                    case .addNewCity:
                        AddCityNameScreen().environmentObject(store)
                }
            })
            
            .navigationBarItems(trailing: Button(action: {
                activeSheet = .addNewCity
            }) {
                Image(systemName: "plus")
            })
            .navigationTitle("Cities")
        }
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    let weather: Forecast
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {

                Text("Humidity --- \(weather.main.humidity)")
                    .fontWeight(.bold)
        
                Text("Wind speed -- \(weather.wind.speed)")
                    .fontWeight(.bold)
                Text("CloudStatus -- \(weather.weather.first?.description ?? "clouds")")
                    .fontWeight(.bold)
                URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.weather.first?.icon ?? ""))
                                .frame(width: 50, height: 50)
            }
            Spacer()

            

        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}

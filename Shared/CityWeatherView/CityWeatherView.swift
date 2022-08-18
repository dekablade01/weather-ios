//
//  CityWeatherView.swift
//  Shared
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI


struct CityWeatherView: View {
    
    let cityName: String
    var body: some View {
//        ScrollView {
            
             VStack {
                 WeatherCardView(
                     dayOfWeek: "Sunday",
                     weatherIconURL: URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!,
                     weatherDescription: "Broken Cloud",
                     temperature: 25.6,
                     humidity: 25

                 )
                 Spacer()

             }
             .navigationBarTitle(Text(cityName))
//             .navigationBarTitleDisplayMode(.inline)

//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
            CityWeatherView(cityName: "Bangkok")
        }
    }
}

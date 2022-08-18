//
//  CityWeatherView.swift
//  Shared
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI
protocol CityWeatherViewModelProtocol {
    
    func appear() async
}

final class CityWeatherViewModel: ObservableObject, CityWeatherViewModelProtocol{
  
    private let requestManager: RequestManagerProtocol
    private var cityName: String
    @Published private(set) var location: Location?
    init(cityName: String, requestManager: RequestManagerProtocol) {
        self.cityName = cityName
        self.requestManager = requestManager
    }
    
    func appear() async {
    
        do {
            location = try await requestManager.request(request: .weather(for: "Bangkok"))
        } catch {
            print(error)
        }
    }
    
}

struct CityWeatherView: View {
    
    @StateObject var viewModel: CityWeatherViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                WeatherCardView(
                    weatherIconURL: viewModel.location?.weather.first.map(\.iconURL),
                    weatherDescription: viewModel.location?.name ?? "",
                    temperature: viewModel.location?.main.temp ?? 0,
                    humidity: viewModel.location?.main.humidity ?? 0,
                    windSpeed: viewModel.location?.wind.speed ?? 0
                )
                Spacer()
            }
        }
        .navigationBarTitle(Text(viewModel.location?.name ?? ""))
        .task { await viewModel.appear() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
        }
    }
}

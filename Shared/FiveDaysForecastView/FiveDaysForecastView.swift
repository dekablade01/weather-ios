//
//  FiveDaysForecastView.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

protocol FiveDaysForecastViewModelProtocol {
    
    func fetch() async 
}

@MainActor final class FiveDaysForecastViewModel: ObservableObject, FiveDaysForecastViewModelProtocol {
    
    @Published private(set) var locations: [Forecast] = []

    let cityName: String
    private let requestManager: RequestManagerProtocol
    private let temperatureService: TemperatureUnitServiceProtocol
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en")
        dateFormatter.dateFormat = "EEEE d\nHH:mm"
        return dateFormatter
    }()
    
    
    init(cityName: String, requestManager: RequestManagerProtocol, temperatureService: TemperatureUnitServiceProtocol) {
        self.cityName = cityName
        self.requestManager = requestManager
        self.temperatureService = temperatureService
    }
    
    func fetch() async {
        do {
            locations = try await requestManager
                .request(request: .forecast(for: cityName))
                .asLocations
        } catch {
            print(error)
        }
    }
    
    func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func formattedTemperature(for double: Double) -> String {
        return String(format: "%.1f \(temperatureService.getCurrentUnit().unit)", double)
    }
}

struct FiveDaysForecastView: View {
    
    @StateObject var viewModel: FiveDaysForecastViewModel
    
    var body: some View {
        List((viewModel.locations)) { item in
            FiveDaysForecastItemView(
                imageURL: item.iconURL,
                weatherDesc: item.weatherDescription,
                dateString: viewModel.string(from: item.date),
                temperature: viewModel.formattedTemperature(for: item.temperature)
            )
            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .listRowSeparator(.hidden)
            
        }
        .navigationTitle(viewModel.cityName)
        .task { await viewModel.fetch()
        }
    }
}

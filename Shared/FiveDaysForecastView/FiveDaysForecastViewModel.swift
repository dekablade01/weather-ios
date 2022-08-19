//
//  FiveDaysForecastViewModel.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

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
    
    func formattedTemperature(for double: Double? = 0) -> String {
        TemperatureFormatter().string(for: double ?? 0, with: temperatureService.getCurrentUnit())
    }
}

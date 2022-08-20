//
//  FiveDaysForecastViewModel.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 20/8/22.
//

import Foundation

protocol FiveDaysForecastViewModelProtocol {
    
    func fetch() async
}

@MainActor final class FiveDaysForecastViewModel: ObservableObject, FiveDaysForecastViewModelProtocol {
    
    @Published private(set) var forecast: [Forecast] = []

    let cityName: String
    private let forecastService: ForecastServiceProtocol
    private let temperatureService: TemperatureUnitServiceProtocol
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en")
        dateFormatter.dateFormat = "EEEE d\nHH:mm"
        return dateFormatter
    }()
    
    
    init(cityName: String, forecastService: ForecastServiceProtocol, temperatureService: TemperatureUnitServiceProtocol) {
        self.cityName = cityName
        self.forecastService = forecastService
        self.temperatureService = temperatureService
    }
    
    func fetch() async {
        do {
            let _forecast = try await forecastService.fiveDaysForecast(for: cityName)
            DispatchQueue.main.async { self.forecast = _forecast }
        } catch {
            print(error)
        }
    }
    
    func string(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    func formattedTemperature(for double: Double? = 0) -> String {
        TemperatureFormatter().string(for: double ?? 0, with: temperatureService.getCurrentUnit())
    }
}

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

final class FiveDaysForecastViewModel: ObservableObject, FiveDaysForecastViewModelProtocol {
    
    @Published private(set) var forecast: [Forecast] = []
    @Published private(set) var error: Error?
    
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
            DispatchQueue.main.async { self.error = error }
        }
    }
    
    func string(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    func formattedTemperature(for double: Double?) -> String {
        guard
            let double = double,
            let string = TemperatureFormatter()
                .string(for: double, with: temperatureService.getCurrentUnit())
        else { return "" }
        return string
    }
}

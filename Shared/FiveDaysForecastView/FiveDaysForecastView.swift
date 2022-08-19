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
    
    private let cityName: String
    private let requestManager: RequestManagerProtocol
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en")
        dateFormatter.dateFormat = "EEEE d HH:mm"
        return dateFormatter
    }()

    @Published private(set) var locations: [Forecast] = []
    
    init(cityName: String, requestManager: RequestManagerProtocol) {
        self.cityName = cityName
        self.requestManager = requestManager
    }
    
    func fetch() async {
        do {
            locations = try await requestManager
                .request(request: .forecast(for: cityName))
                .asLocations

            locations.forEach { print($0.weatherDescription) }
        } catch {
            print(error)
        }
    }
    
    func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

struct FiveDaysForecastView: View {
    
    @StateObject var viewModel: FiveDaysForecastViewModel
    
    var body: some View {
        List((viewModel.locations)) { item in
            FiveDaysForecastItemView(
                imageURL: item.iconURL,
                weatherDesc: item.weatherDescription,
                dateString: viewModel.string(from: item.date)
            )
            
        }
        .task {
            await viewModel.fetch()
        }
    }
}

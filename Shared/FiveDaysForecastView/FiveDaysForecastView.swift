//
//  FiveDaysForecastView.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

struct FiveDaysForecastView: View {
    
    @StateObject var viewModel: FiveDaysForecastViewModel
    
    var body: some View {
        List((viewModel.forecast)) { item in
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
        .task { await viewModel.fetch() }
        .accessibilityIdentifier("five_days_forecast_view")
    }
}

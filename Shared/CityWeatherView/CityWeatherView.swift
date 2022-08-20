//
//  CityWeatherView.swift
//  Shared
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    
    @StateObject private var viewModel: CityWeatherViewModel
    @State private var isOpeningSearchDialog = false
    
    init(viewModel: CityWeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    VStack {
                        ForEach(viewModel.forecasts) { forecast in
                            NavigationLink(
                                destination: FiveDaysForecastView(
                                    viewModel: .init(
                                        cityName: forecast.name,
                                        requestManager: viewModel.requestManager,
                                        temperatureService: viewModel.temperatureService
                                    )
                                ),
                                label: {
                                    WeatherCardView(
                                        cityName: forecast.name,
                                        weatherIconURL: forecast.iconURL,
                                        weatherDescription: forecast.weatherDescription,
                                        temperature: viewModel.formattedTemperature(for: forecast.temperature),
                                        humidity: forecast.humidity
                                    )
                                }
                            )
                            .disabled(isOpeningSearchDialog)
                        }
                    }
                    
                }
                if isOpeningSearchDialog {
                    SearchCardView(
                        text: $viewModel.currentSearch,
                        onSearch: {
                            Task { await viewModel.fetch() }
                            withAnimation {
                                isOpeningSearchDialog = false
                                reader.scrollTo(viewModel.forecasts.last?.id)
                            }
                        },
                        onCancel: { withAnimation { isOpeningSearchDialog = false } }
                    )
                }
                
            }
        }
        .toolbar {
            ToolbarItemGroup {
                HStack {
                    Button {
                        viewModel.switchTemperatureUnit()
                        Task { await viewModel.fetch() }
                    } label: {
                        Text(viewModel.nextTemperatureUnitName)
                    }
                    Button {
                        withAnimation { isOpeningSearchDialog.toggle() }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
            }
        }
        .navigationBarTitle(Text("Weather"))
        .task { await viewModel.fetch() }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        NavigationView {
//
//        }
//    }
//}

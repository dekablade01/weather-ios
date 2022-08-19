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
            ScrollView {
                VStack {
                    NavigationLink(
                        destination: FiveDaysForecastView(
                            viewModel: .init(
                                cityName: viewModel.cityName,
                                requestManager: viewModel.requestManager,
                                temperatureService: viewModel.temperatureService
                            )),
                        label: {
                            WeatherCardView(
                                cityName: viewModel.cityName,
                                weatherIconURL: viewModel.forecast?.iconURL,
                                weatherDescription: viewModel.forecast?.weatherDescription ?? "",
                                temperature: "\(viewModel.forecast?.temperature ?? 0.0) \(viewModel.temperatureService.getCurrentUnit().unit)",
                                humidity: viewModel.forecast?.humidity ?? 0
                            )
                            Spacer()
                        }
                    )
                    .disabled(isOpeningSearchDialog)
                }
            }
            if isOpeningSearchDialog {
                SearchCardView(
                    text: $viewModel.currentSearch,
                    onSearch: {
                        Task { await viewModel.fetch() }
                        withAnimation {
                            isOpeningSearchDialog = false
                        }
                    },
                    onCancel: { withAnimation { isOpeningSearchDialog = false } }
                )
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
    
        }
    }
}

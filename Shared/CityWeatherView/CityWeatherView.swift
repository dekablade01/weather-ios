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
    @State private var currentSearch = ""
    
    init(viewModel: CityWeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationLink(destination: FiveDaysForecastView(
            viewModel: .init(cityName: viewModel.location!.name, requestManager: viewModel.requestManager))
        )
        {
            ZStack {
                ScrollView {
                    VStack {
                        WeatherCardView(
                            weatherIconURL: viewModel.location?.iconURL,
                            weatherDescription: viewModel.location?.name ?? "",
                            temperature: viewModel.location?.temperature ?? 0,
                            humidity: viewModel.location?.humidity ?? 0,
                            windSpeed: viewModel.location?.windSpeed ?? 0
                        )
                        Spacer()
                    }
                }
                if isOpeningSearchDialog {
                    SearchCardView(
                        text: $currentSearch,
                        onSearch: {
                            Task {
                                await viewModel.search(city: currentSearch)
                                currentSearch = ""
                                withAnimation { isOpeningSearchDialog = false }
                            }
                        },
                        onCancel: { withAnimation { isOpeningSearchDialog = false } }
                    )
                }
            }
        }
        .toolbar {
            ToolbarItemGroup {
                Button {
                    withAnimation { isOpeningSearchDialog.toggle() }
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                
            }
        }
        .navigationBarTitle(Text("Weather"))
        .task { await viewModel.appear() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
        }
    }
}

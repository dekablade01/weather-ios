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
        ZStack {
            ScrollView {
                VStack {
                    WeatherCardView(
                        weatherIconURL: viewModel.location?.weather.first.map { $0.iconURL },
                        weatherDescription: viewModel.location?.name ?? "",
                        temperature: viewModel.location?.main.temp ?? 0,
                        humidity: viewModel.location?.main.humidity ?? 0,
                        windSpeed: viewModel.location?.wind.speed ?? 0
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
                            withAnimation { isOpeningSearchDialog.toggle() }
                        }
                    },
                    onCancel: { withAnimation { isOpeningSearchDialog.toggle() } }
                )
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

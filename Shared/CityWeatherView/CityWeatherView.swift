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
    @State private var isDeleteDialogPresenting: Bool = false
    @State private var deletingCity: String? {
        didSet { isDeleteDialogPresenting = deletingCity != nil }
    }
    @State private var currentSearch = ""
    
    private let screenFactory: WeatherScreenFactory
    
    init(viewFactory: WeatherScreenFactory, viewModel: CityWeatherViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.screenFactory = viewFactory
    }
    
    var body: some View {
        ZStack {
            if !viewModel.weatherModels.isEmpty {
                List(viewModel.weatherModels, id: \.cityName) { model in
                    NavigationLink(
                        destination: screenFactory.fiveDaysForecast(for: model.cityName),
                        label: { WeatherCardView(model: model) }
                    )
                    .swipeActions {
                        Button("Delete") { withAnimation { viewModel.delete(model.cityName) } }
                            .tint(.red)
                    }
                    .disabled(isOpeningSearchDialog)
                }
                .listStyle(.inset)
                .refreshable { viewModel.refresh() }
            } else {
                Text("No city")
            }
            
            if isOpeningSearchDialog {
                SearchCardView(
                    text: $currentSearch,
                    onSearch: {
                        withAnimation {
                            viewModel.addCity(currentSearch)
                            viewModel.refresh()
                            isOpeningSearchDialog = false
                            currentSearch = ""
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
                        viewModel.refresh()
                    } label: { Text(viewModel.nextTemperatureUnitName) }
                    Button {
                        withAnimation { isOpeningSearchDialog.toggle() }
                    } label: { Image(systemName: "magnifyingglass") }
                }
                
            }
        }
        .navigationBarTitle(Text("Weather"))
        .task { viewModel.refresh() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherScreenFactory.preview.citiesList()
        }
    }
}

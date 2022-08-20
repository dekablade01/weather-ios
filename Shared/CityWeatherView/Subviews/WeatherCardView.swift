//
//  WeatherCardView.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI

struct WeatherCardView: View {
    let cityName: String
    let weatherIconURL: URL?
    let weatherDescription: String
    let temperature: String
    let humidity: Int
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20.0) {
                Text(cityName)
                    .font(.system(size: 48.0, weight: .medium, design: .rounded))

                AsyncImage(url: weatherIconURL, transaction: .init(animation: .spring())) {
                    switch $0 {
                    case .empty:
                        Color.clear.opacity(0.0)
                    case let .success(image):
                        image.resizable().scaledToFill()
                    case .failure:
                        Image(systemName: "exclamationmark.icloud")
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }
                .frame(width: 120, height: 120)
                Text(weatherDescription)
                    .font(.system(size: 36.0, weight: .medium, design: .rounded))
                    .padding(.init(top: -40, leading: 0, bottom: 4, trailing: 0))
                Text(temperature)
                    .font(.system(size: 80.0, weight: .medium, design: .rounded))
                Rectangle().frame(height: 1, alignment: .center)
                HStack(alignment: .top, spacing: 40.0) {
                    WeatherCardViewItemView(title: "Humidity", value: "\(humidity)%")

                }
            }
            .padding()
            .background(.green)
            .cornerRadius(10.0)
            .foregroundColor(.white)
        }
        .padding(20)
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherCardView(
            cityName: "Bangkok",
            weatherIconURL: URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!,
            weatherDescription: "Broken Cloud",
            temperature: "25.6 C",
            humidity: 25
        )
        .previewLayout(.sizeThatFits)
    }
}

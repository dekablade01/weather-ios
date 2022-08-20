//
//  WeatherCardView.swift
//  Weather (iOS)
//
//  Created by Issarapong Poesua on 18/8/22.
//

import SwiftUI

struct WeatherCardView: View {
    
    struct Model {
        let cityName: String
        let weatherIconURL: URL?
        let weatherDescription: String
        let temperature: String
        let humidity: Int
    }
    
    
    let model: Model
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20.0) {
                Text(model.cityName)
                    .font(.system(size: 48.0, weight: .medium, design: .rounded))
                AsyncImageWithAnimation(imageURL: model.weatherIconURL)
                .frame(width: 120, height: 120)
                Text(model.weatherDescription)
                    .font(.system(size: 28.0, weight: .medium, design: .rounded))
                    .padding(.init(top: -40, leading: 0, bottom: 4, trailing: 0))
                Text(model.temperature)
                    .font(.system(size: 60.0, weight: .medium, design: .rounded))
                Rectangle().frame(height: 1, alignment: .center)
                HStack(alignment: .top, spacing: 40.0) {
                    WeatherCardViewItemView(title: "Humidity", value: "\(model.humidity)%")

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
            model: .init(
                cityName: "Bangkok",
                weatherIconURL: URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!,
                weatherDescription: "Broken Cloud",
                temperature: "25.6 C",
                humidity: 25
            )
        )
        .previewLayout(.sizeThatFits)
    }
}


struct AsyncImageWithAnimation: View {
    
    var imageURL: URL?
    
    var body: some View {
        
        AsyncImage(url: imageURL, transaction: .init(animation: .spring())) {
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
    }
}

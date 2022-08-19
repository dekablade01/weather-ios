//
//  FiveDaysForecastItemView.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

struct FiveDaysForecastItemView: View {
    
    let imageURL: URL?
    let weatherDesc: String
    let dateString: String
    let temperature: String
    
    var body: some View {
    
        HStack(spacing: 12.0) {
            VStack {
                VStack {
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
                    Text("\(temperature)")
                        .padding([.top], -24)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding()
            }
            .frame(width: 120.0, height: 100)
            .background(.gray)
            .cornerRadius(12.0)
            Spacer()
            VStack(alignment: .center) {
                Text(dateString)
                    .foregroundColor(.white)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .fixedSize()
                    
            }
            Spacer()
        }
        .background(.green)
        .cornerRadius(12.0)
    }
}

struct FiveDaysForecastItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        FiveDaysForecastItemView(
            imageURL: URL(string: "https://openweathermap.org/img/wn/04d@2x.png"),
            weatherDesc: "Lightning",
            dateString: "2020-07-10 15:00:00",
            temperature: "30 C"
        )
        .previewLayout(.sizeThatFits)
    }

}

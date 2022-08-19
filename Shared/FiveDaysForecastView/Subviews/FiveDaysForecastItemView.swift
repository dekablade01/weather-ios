//
//  FiveDaysForecastItemView.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

struct FiveDaysForecastItemView: View {
    
    var imageURL: URL?
    var weatherDesc: String
    let dateString: String
    
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
                }
                .padding()
            }
            .frame(width: 120.0, height: 100)
            .background(.gray)
            .cornerRadius(12.0)
            VStack(alignment: .center) {
                Text(dateString)
                    .font(.system(.title3, design: .rounded))
            }
//            Spacer()
        }
        .padding()
        
    }
}

struct FiveDaysForecastItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        FiveDaysForecastItemView(
            imageURL: URL(string: "https://openweathermap.org/img/wn/04d@2x.png"),
            weatherDesc: "Lightning",
            dateString: "2020-07-10 15:00:00"
        )
  
        .previewLayout(.sizeThatFits)
    }

}

//
//  AsyncImageWithAnimation.swift
//  Weather
//
//  Created by Issarapong Poesua on 23/8/22.
//

import SwiftUI

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

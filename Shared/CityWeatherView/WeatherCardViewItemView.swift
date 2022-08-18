//
//  WeatherCardViewItemView.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

struct WeatherCardViewItemView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8.0) {
                Text(title)
                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
                Text(value)
                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
            }
            .padding()
            .foregroundColor(.green)
            .background(.white)
            .cornerRadius(12.0)
        }
    }
}


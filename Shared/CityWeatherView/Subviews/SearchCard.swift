//
//  SearchCard.swift
//  KrungsriAssignment (iOS)
//
//  Created by Issarapong Poesua on 19/8/22.
//

import SwiftUI

struct SearchCardView: View {
    
    @Binding var text: String
    var onSearch: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 12.0) {
                    Text("Search City")
                        .foregroundColor(.green)
                        .font(.system(size: 28.0, weight: .bold, design: .rounded))
                    Text("Type the city you want")
                        .foregroundColor(.gray)
                        .font(.system(size: 16.0, weight: .regular, design: .rounded))
                    TextField("City name", text: $text)
                        .font(.system(size: 28.0, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.init(top: 20.0, leading: 0, bottom: 0, trailing: 0))
                    Rectangle().frame(height: 1.0)
                        .background(.green)
                    HStack(spacing: 20.0) {
                        Spacer()
                        Button(action: onCancel,
                               label: {
                            Text("Cancel")
                                .font(.system(size: 16.0, weight: .bold, design: .rounded))
                        })
                            .foregroundColor(.gray)

                        Button(action: onSearch,
                               label: {
                            Text("Go")
                                .frame(width: 64, height: 40)
                                .font(.system(size: 16.0, weight: .bold, design: .rounded))

                        })
                    
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(12.0)
                    }
                }
                .padding()
                
            }
            .background(.white)
            .cornerRadius(12.0)
            .shadow(radius: 12.0)
        }
        .padding()
        .foregroundColor(.clear)
    }
}


struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardView(
            text: .constant("Hello"),
            onSearch: { },
            onCancel: { }
        )
        .previewLayout(.sizeThatFits)
    }
}

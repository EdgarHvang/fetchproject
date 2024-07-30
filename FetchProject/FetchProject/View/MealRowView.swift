//
//  DesertDetailView.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation
import SwiftUI

struct MealRowView: View {
    let meal: Meal
    
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        HStack {
            Group {
                if let uiImage = imageLoader.image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60,height: 60 )
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                imageLoader.loadImage(from: meal.MealThumb)
            }
            
            VStack(alignment: .leading) {
                Text(meal.id)
                    .font(.headline)
                Text(meal.mealName)
                    .font(.subheadline)
            }
        }
    }
}

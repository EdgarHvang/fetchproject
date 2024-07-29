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

    var body: some View {
        HStack {
            AsyncImage(url: meal.strMealThumb) { image in
                image.resizable()
                     .scaledToFill()
                     .frame(width: 50, height: 50)
                     .clipped()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(meal.id)
                    .font(.headline)
                Text(meal.strMeal)
                    .font(.subheadline)
            }
        }
    }
}

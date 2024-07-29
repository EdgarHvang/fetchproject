//
//  MealDetailView.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation
import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    @ObservedObject var mealDetailViewModel: MealDetailViewModel = MealDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: meal.strMealThumb) { image in
                    image.resizable()
                         .scaledToFill()
                         .frame(maxHeight: 300)
                         .clipped()
                } placeholder: {
                    ProgressView()
                }

                Text(mealDetailViewModel.mealDetail?.name ?? "xx")
                    .font(.largeTitle)
                    .padding(.top)

                Text(mealDetailViewModel.mealDetail?.category ?? "xx")
                    .font(.title2)
                    .foregroundColor(.secondary)

                Text("Instructions")
                    .font(.title3)
                    .padding(.top)

                Text(mealDetailViewModel.mealDetail?.instructions ?? "")
                    .padding(.top, 1)

                if !(mealDetailViewModel.mealDetail?.ingredients.isEmpty ?? false) {
                    Text("Ingredients")
                        .font(.title3)
                        .padding(.top)
                    
                    ForEach(Array(zip(mealDetailViewModel.mealDetail?.ingredients ?? [""], mealDetailViewModel.mealDetail?.measures ?? [""])), id: \.0) { ingredient, measure in
                        Text("\(ingredient): \(measure)")
                    }
                }

                if let source = mealDetailViewModel.mealDetail?.source, let url = URL(string: source) {
                    Link("Recipe Source", destination: url)
                        .padding(.top)
                }

                if let url = URL(string: mealDetailViewModel.mealDetail?.youtube ?? "") {
                    Link("Watch on YouTube", destination: url)
                        .padding(.top)
                }
            }
            .padding()
        }
        .task {
            await mealDetailViewModel.loadDataWithMealIde(self.meal.idMeal)
        }
        .navigationTitle(meal.strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
        
}

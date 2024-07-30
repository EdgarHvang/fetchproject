//
//  MealViewModel.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var errorMessage: String?
    @Published var isLoading = false

    func loadData() async {
        isLoading = true
        do {
            let meals = try await ApiClient.shared.fetchMealData()
            self.meals = meals
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false

    }
    
 

    
}

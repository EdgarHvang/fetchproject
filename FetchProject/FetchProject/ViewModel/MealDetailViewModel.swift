//
//  MealDetailViewModel.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    
    @Published var mealDetail: MealDetail?
    @Published var errorMessage: String?
    @Published var isLoading = false

    func loadDataWithMealIde(_ mealId: String) async {
        isLoading = true
        do {
            let mealDetail = try await ApiClient.shared.fetchMealDetails(mealId)
            self.mealDetail = mealDetail
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false

    }
    
 

    
}

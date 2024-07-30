//
//  MockApiClient.swift
//  FetchProjectTests
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation
@testable import FetchProject

class MockApiClient: ApiClientProtocol {

    
    var shouldReturnError = false
    var mockMealDetail: MealDetail?

    func fetchMealData() async throws -> [Meal] {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        } else {
            return [try Meal(from: "Test Meal 1" as! Decoder), try Meal(from: "Test Meal 2" as! Decoder)]
        }
    }
    

    func fetchMealDetails(_ mealId: String) async throws -> MealDetail {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        } else if let mealDetail = mockMealDetail {
            return mealDetail
        } else {
            throw NSError(domain: "TestError", code: 2, userInfo: [NSLocalizedDescriptionKey: "No meal detail set"])
        }
    }
}

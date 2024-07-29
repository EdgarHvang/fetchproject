//
//  ApiClient.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

enum EndPoint: String {
    case desertURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    case desertDetailBaseURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case doesNotExist
}

class ApiClient {
   
    static let shared = ApiClient()
    
    private init () {
        
    }
    
    func fetchMealData() async throws -> [Meal] {
        guard let url = URL(string: EndPoint.desertURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        let mealsResponse = try? JSONDecoder().decode(DesertReponse.self, from: data)
        return mealsResponse?.meals ?? []
    }
    
    func fetchMealDetails(_ mealID: String) async throws -> MealDetail {
        
        guard let url = URL(string: EndPoint.desertDetailBaseURL.rawValue + mealID) else { throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        let MealDetailResponse = try? JSONDecoder().decode(MealDetailResponse.self, from: data)
        guard let mealDetail = MealDetailResponse?.meals[0] as? MealDetail else {
            throw NetworkError.doesNotExist
        }
//        print(mealDetail)
        return mealDetail
    }

}



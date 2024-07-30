//
//  DesertModel.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

struct DesertResponse: Decodable {
    let meals: [Meal]
    
}

struct Meal: Decodable, Identifiable {
    let mealName: String
    let MealThumb: URL
    let mealId: String
    
    var id: String {
        return mealId
    }
    
    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case MealThumb = "strMealThumb"
        case mealId = "idMeal"
    }
}


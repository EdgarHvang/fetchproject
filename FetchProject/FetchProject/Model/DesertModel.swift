//
//  DesertModel.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

struct DesertReponse: Decodable {
    let meals: [Meal]
    
}

struct Meal: Decodable, Identifiable {
    let strMeal: String
    let strMealThumb: URL
    let idMeal: String
    
    var id: String {
        return idMeal
    }
}


//
//  DesertDetailModel.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import Foundation

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}

struct MealDetail: Decodable {
    let id: String
    let name: String
    let drinkAlternate: String?
    let category: String
    let area: String
    let instructions: String
    let mealThumb: String
    let tags: String?
    let youtube: String
    let ingredients: [String]
    let measures: [String]
    let source: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case mealThumb = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case source = "strSource"
        
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
             strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
             strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
             strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
             strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
             strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
             strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        mealThumb = try container.decode(String.self, forKey: .mealThumb)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtube = try container.decode(String.self, forKey: .youtube)
        source = try container.decodeIfPresent(String.self, forKey: .source)

        var ingredients: [String] = []
        for i in 1...20 {
            let key = CodingKeys(stringValue: "strIngredient\(i)")!
            if let ingredient = try container.decodeIfPresent(String.self, forKey: key), !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
        }
        self.ingredients = ingredients

        var measures: [String] = []
        for i in 1...20 {
            let key = CodingKeys(stringValue: "strMeasure\(i)")!
            if let measure = try container.decodeIfPresent(String.self, forKey: key), !measure.isEmpty {
                measures.append(measure)
            }
        }
        self.measures = measures
    }
}

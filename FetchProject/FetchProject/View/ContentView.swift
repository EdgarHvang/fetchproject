//
//  ContentView.swift
//  FetchProject
//
//  Created by Qiyao Huang on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var mealViewModel: MealViewModel
    
    init() {
        self.mealViewModel = MealViewModel()
    }
    
    var body: some View {
        VStack {
            List(mealViewModel.meals) { meal in
                HStack {
                    NavigationLink(destination: MealDetailView(meal: meal)) {
                        MealRowView(meal: meal)
                    }
                }
            }
        }.task {
            await mealViewModel.loadData()
        }
        .navigationTitle("Desert")
        .padding()
    }
}

//#Preview {
//    ContentView()
//}

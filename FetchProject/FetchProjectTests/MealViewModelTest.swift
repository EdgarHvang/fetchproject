//
//  MealViewModelTest.swift
//  FetchProjectTests
//
//  Created by Qiyao Huang on 7/29/24.
//

import XCTest
@testable import FetchProject

final class MealViewModelTest: XCTestCase {

        var viewModel: MealViewModel!
        var mockApiClient: MockApiClient!
        
    @MainActor override func setUp() {
            super.setUp()
            mockApiClient = MockApiClient()
            viewModel = MealViewModel()
        }
        
        override func tearDown() {
            viewModel = nil
            mockApiClient = nil
            super.tearDown()
        }
        
    @MainActor func testLoadDataSuccess() async {
            mockApiClient.shouldReturnError = false
            
            await viewModel.loadData()
            
            XCTAssertEqual(viewModel.meals.count, 65)
            XCTAssertNil(viewModel.errorMessage)
            XCTAssertFalse(viewModel.isLoading)
        }
}


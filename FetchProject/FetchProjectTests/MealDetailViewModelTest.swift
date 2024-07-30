
import XCTest
@testable import FetchProject


final class MealDetailViewModelTests: XCTestCase {
    
    var viewModel: MealDetailViewModel!
    var mockApiClient: MockApiClient!
    
    @MainActor override func setUp() {
        super.setUp()
        mockApiClient = MockApiClient()
        viewModel = MealDetailViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        mockApiClient = nil
        super.tearDown()
    }
    

    
    @MainActor func testLoadDataWithMealId() async {
        mockApiClient.shouldReturnError = true
        
        await viewModel.loadDataWithMealIde("53049")
        
        XCTAssertEqual(viewModel.mealDetail?.ingredients[0], "Milk")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[1], "Oil")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[2], "Eggs")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[3], "Flour")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[4], "Baking Powder")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[5], "Salt")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[6], "Unsalted Butter")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[7], "Sugar")
        XCTAssertEqual(viewModel.mealDetail?.ingredients[8], "Peanut Butter")
    }
}

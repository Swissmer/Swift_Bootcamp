import XCTest
@testable import task1

final class SimpleCalculatorTests: XCTestCase {
    
    var tmp: SimpleCalculator!

    override func setUpWithError() throws {
        self.tmp = SimpleCalculator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        self.tmp = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCircleArea() {
        //given
        let radius: Double = 10
        
        //when
        let result = tmp.circleArea(radius: radius)
        
        //then
        XCTAssertEqual(result, 314)
    }
    
    func testFibonacci() {
        //given
        let n1 = 0
        let n2 = 3
        let n3 = -1
        let n4 = 53
        let n5 = 1
        
        //when
        let result1 = tmp.fibonacci(n: n1)
        let result2 = tmp.fibonacci(n: n2)
        let result3 = tmp.fibonacci(n: n3)
        let result4 = tmp.fibonacci(n: n4)
        let result5 = tmp.fibonacci(n: n5)
        
        //then
        XCTAssertEqual(result1, 0)
        XCTAssertEqual(result2, 2)
        XCTAssertEqual(result3, 0)
        XCTAssertEqual(result4, 53316291173)
        XCTAssertEqual(result5, 1)
    }
    
    func testFahrenheit() {
        //given
        let celcius: Double = 0
        
        //when
        let result = tmp.fahrenheit(celcius: celcius)
        
        //then
        XCTAssertEqual(result, 32)
    }
    
    func testIsEven() {
        //given
        let n1 = 0
        let n2 = 31232
        let n3 = -1
        let n4 = -4
        
        //when
        let result1 = tmp.isEven(num: n1)
        let result2 = tmp.isEven(num: n2)
        let result3 = tmp.isEven(num: n3)
        let result4 = tmp.isEven(num: n4)
        
        //then
        XCTAssertTrue(result1)
        XCTAssertTrue(result2)
        XCTAssertFalse(result3)
        XCTAssertTrue(result4)
    }
    
    func testGetAvg() {
        //given
        let numbers1: [Double] = []
        let numbers2 = [5.0]
        let numbers3 = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        //when
        let average1 = tmp.getAvg(numbers: numbers1)
        let average2 = tmp.getAvg(numbers: numbers2)
        let average3 = tmp.getAvg(numbers: numbers3)
        
        //then
        XCTAssertNil(average1)
        XCTAssertNotNil(average2)
        XCTAssertNotNil(average3)
        
        XCTAssertEqual(average2, 5.0)
        XCTAssertEqual(average3, 3.0)
        
    }
}

//
//  UtilityTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UtilityTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Utility_parsingStringToXY_returns_x24_y24() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            let xyPos = try Utility.parsingStringToXY(pointInBracket: "(24,24)")
            XCTAssertTrue(xyPos == (24,24))
            
        }
        catch PointValueError.invalidFormat {
            XCTFail()
        }
        catch {
            XCTFail()
        }
    }
    
    func test_Utility_parsingStringToXY_returs_x24_y1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            let xyPos = try Utility.parsingStringToXY(pointInBracket: "(24,1)")
            XCTAssertTrue(xyPos == (24,1))
            
        }
        catch PointValueError.invalidFormat {
            XCTFail()
        }
        catch {
            XCTFail()
        }
    }
    
    func test_Utility_parsingStringToXY_returs_x100_y100() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            let xyPos = try Utility.parsingStringToXY(pointInBracket: "(100,100)")
            XCTAssertTrue(xyPos == (100,100))
            
        }
        catch PointValueError.invalidFormat {
            XCTFail()
        }
        catch {
            XCTFail()
        }
    }
    
    func test_Utility_parsingStringToXY_throws_invalid_format_unknowChracter() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            try Utility.parsingStringToXY(pointInBracket: "%24,1)")
            XCTFail()
            
        }
        catch PointValueError.invalidFormat {
            XCTAssert(true)
        }
        catch {
            XCTFail()
        }
    }
    
    
    func test_Utility_Parsing_PointString_invalid_format_over_count() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            try Utility.parsingStringToXY(pointInBracket: "(24,1,5)")
            XCTFail()
            
        }
        catch PointValueError.invalidFormat {
            XCTAssert(true)
        }
        catch {
            XCTFail()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

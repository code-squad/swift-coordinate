//
//  MakeShapeTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MakeShapeTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MakeShape_returns_MyPoint() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            let shapeByPoints = try MakeShape.makeShapeByPoints(points: [(10,2)])
            
            XCTAssertTrue(shapeByPoints is MyPoint)
            
        }
        catch PointValueError.invalidRange {
            XCTFail()
        }
        catch PointValueError.invalidFormat {
            XCTFail()
        }
        catch PointValueError.samePoints {
            XCTFail()
        }
        catch {
            XCTFail()
        }
    }
    
    func test_MakeShape_returns_MyLine() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            let shapeByPoints = try MakeShape.makeShapeByPoints(points: [(10,2), (24, 6)])
            
            XCTAssertTrue(shapeByPoints is MyLine)
            
        }
        catch PointValueError.invalidRange {
            XCTFail()
        }
        catch PointValueError.invalidFormat {
            XCTFail()
        }
        catch PointValueError.samePoints {
            XCTFail()
        }
        catch {
            XCTFail()
        }
    }
    
    func test_MakeShape_throws_same_points() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertThrowsError(try MakeShape.makeShapeByPoints(points: [(10,12), (10, 12)]))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

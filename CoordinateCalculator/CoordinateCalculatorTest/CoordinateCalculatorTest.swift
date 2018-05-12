//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by Yoda Codd on 2018. 5. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
    /// 직사각형 체크 함수 테스트
    func testCheckRectPosition(){
        let checker = Checker()
        let flag = checker.isCorrectPointType(letters: "(0,0)-(0,99)-(99,0)-(99,99)")
        XCTAssert(flag)
    }
    
}

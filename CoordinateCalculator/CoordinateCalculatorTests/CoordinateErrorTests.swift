//
//  CoordinateErrorTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateErrorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoordinateError_wrong_format_should_contain_user_message() {
        let errorString = "Wrong Format"
        let error = CoordinateError.wrongInputFormat(message: errorString)
        XCTAssertNotNil(error.errorDescription)
        XCTAssertTrue(error.errorDescription!.contains(errorString))
    }
    
    func testCoordinateError_should_return_errorMessage() {
        let errors: [CoordinateError] = [.internalError, .alreadyExist, .exceedMaxUserInput]
        errors.forEach {
            XCTAssertNotNil($0.errorDescription)
        }
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

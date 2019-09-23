//
//  UserInputErrorTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UserInputErrorTests: XCTestCase {

    func testUserInputError_wrong_format_should_contain_user_message() {
        let errorString = "Wrong Format"
        let error = UserInputError.wrongInputFormat(message: errorString)
        XCTAssertNotNil(error.errorDescription)
        XCTAssertTrue(error.errorDescription!.contains(errorString))
    }
    
    func testUserInputError_should_return_errorMessage() {
        let errors: [UserInputError] = [.internalError, .alreadyExist, .exceedMaxUserInput, .inputParsingError]
        errors.forEach {
            XCTAssertNotNil($0.errorDescription)
        }
    }
}

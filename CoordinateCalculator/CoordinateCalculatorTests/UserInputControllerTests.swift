//
//  UserInputControllerTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UserInputControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    lazy var controller: UserInputController = {
        let reader = MockUserInputView()
        return UserInputController(inputReader: reader)
    }()
    
    func configureTest(with strings: [String]) {
        MockUserInputView.pos = 0
        MockUserInputView.inputs = strings
    }
    
    func testUserInputController_readPoint_no_input_should_return_nil() {
        let strings =  [""]
        configureTest(with: strings)
        let point = try? controller.readPoint(tries: strings.count)
        XCTAssertNil(point)
    }
    
    func testUserInputController_readPoint_should_return_mypoint() {
        let strings =  ["(9,0)"]
        configureTest(with: strings)
        let point = try? controller.readPoint(tries: strings.count)
        XCTAssertTrue(point?.x==9 && point?.y==0)
    }
    
    func testUserInputController_readPoint_should_return_mypoint_with_secondString() {
        let strings =  ["(-9,0)", "(10,10)"]
        configureTest(with: strings)
        let point = try? controller.readPoint(tries: strings.count)
        XCTAssertTrue(point?.x==10 && point?.y==10)
    }
    
    func testUserInputController_readPoint_should_return_nil() {
        let strings =  ["(-9,10)"]
        configureTest(with: strings)
        let point = try? controller.readPoint(tries: strings.count)
        XCTAssertNil(point)
    }
    
    func testUserInputController_readPoint_should_throw_error() {
        let strings =  ["(-9,0)"]
        configureTest(with: strings)
        do {
            _ = try controller.readPoint(tries: strings.count)
            XCTFail()
        }
        catch let e {
            guard let error = e as? CoordinateError else {
                XCTFail()
                return
            }
            XCTAssertTrue( error.errorDescription == CoordinateError.exceedMaxUserInput.errorDescription)
        }
    }
    
    func testUserInputController_readValidString_should_return_first_string() {
        let strings =  ["(1,0)", "(-14,10)", "(-11,11)"]
        configureTest(with: strings)
        let string = controller.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(1,0)")
    }
    
    func testUserInputController_readValidString_should_return_second_string() {
        let strings =  ["(-1,0)", "(14,10)", "(-11,11)"]
        configureTest(with: strings)
        let string = controller.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(14,10)")
    }

    func testUserInputController_readValidString_should_return_last_string() {
        let strings = ["(-1,0)", "(-24,10)", "(11,11)"]
        configureTest(with: strings)
        let string = controller.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(11,11)")
    }
    
    func testUserInputController_readValidString_should_return_nil() {
        let strings = ["(-1,0)", "(-24,10)", "(11,-11)"]
        configureTest(with: strings)
        let string = controller.readValidString(tries: strings.count)
        XCTAssertNil(string)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

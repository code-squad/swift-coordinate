//
//  ShapeFactoryTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class ShapeFactoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    lazy var factory: ShapeFactory = {
        let reader = MockUserInputView()
        return ShapeFactory(inputReader: reader)
    }()
    
    func configureTest(with strings: [String]) {
        MockUserInputView.pos = 0
        MockUserInputView.inputs = strings
    }
    
    func testShapeFactory_readShape_no_input_should_return_nil() {
        let strings =  [""]
        configureTest(with: strings)
        let point = try? factory.readShape(tries: strings.count)
        XCTAssertNil(point)
    }
    
    func testShapeFactory_readShape_should_return_mypoint() {
        let strings =  ["(9,0)"]
        configureTest(with: strings)
        let shape = try? factory.readShape(tries: strings.count)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==9 && point.y==0)
    }
    
    func testShapeFactory_readShape_should_return_mypoint_with_secondString() {
        let strings =  ["(-9,0)", "(10,10)"]
        configureTest(with: strings)
        let shape = try? factory.readShape(tries: strings.count)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==10 && point.y==10)
    }
    
    func testShapeFactory_readShape_should_return_nil() {
        let strings =  ["(-9,10)"]
        configureTest(with: strings)
        let point = try? factory.readShape(tries: strings.count)
        XCTAssertNil(point)
    }
    
    func testShapeFactory_readShape_should_throw_error() {
        let strings =  ["(-9,0)"]
        configureTest(with: strings)
        do {
            _ = try factory.readShape(tries: strings.count)
            XCTFail()
        }
        catch let e {
            guard let error = e as? UserInputError else {
                XCTFail()
                return
            }
            XCTAssertTrue( error.errorDescription == UserInputError.exceedMaxUserInput.errorDescription)
        }
    }
    
    func testShapeFactory_readValidString_should_return_first_string() {
        let strings =  ["(1,0)", "(-14,10)", "(-11,11)"]
        configureTest(with: strings)
        let string = factory.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(1,0)")
    }
    
    func testShapeFactory_readValidString_should_return_second_string() {
        let strings =  ["(-1,0)", "(14,10)", "(-11,11)"]
        configureTest(with: strings)
        let string = factory.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(14,10)")
    }

    func testShapeFactory_readValidString_should_return_last_string() {
        let strings = ["(-1,0)", "(-24,10)", "(11,11)"]
        configureTest(with: strings)
        let string = factory.readValidString(tries: strings.count)
        XCTAssertTrue(string == "(11,11)")
    }
    
    func testShapeFactory_readValidString_should_return_nil() {
        let strings = ["(-1,0)", "(-24,10)", "(11,-11)"]
        configureTest(with: strings)
        let string = factory.readValidString(tries: strings.count)
        XCTAssertNil(string)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

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
    
    lazy var provider: VertexProvidable = {
        let reader = MockUserInputReader()
        let parser = StringPointParser()
        return VertexProvider(reader: reader, parser: parser)
    }()
    
    func configureTest(with strings: [String]) {
        MockUserInputReader.pos = 0
        MockUserInputReader.inputs = strings
    }
    
    func testShapeFactory_createShape_should_return_nil() {
        let strings =  [""]
        configureTest(with: strings)
        let point = try? ShapeFactory.createShape(verticeProvider: provider)
        XCTAssertNil(point)
    }
    
    func testShapeFactory_createShape_should_return_mypoint() {
        let strings =  ["(9,0)"]
        configureTest(with: strings)
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==9 && point.y==0)
    }
    
    func testShapeFactory_createShape_should_return_myline() {
        let strings =  ["(9,0)-(20,20)"]
        configureTest(with: strings)
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let line = shape as? MyLine else {
            XCTFail()
            return
        }
        XCTAssertTrue(line.pointA.x == 9 && line.pointA.y == 0)
        XCTAssertTrue(line.pointB.x == 20 && line.pointB.y == 20)
    }

    
    func testShapeFactory_createShape_should_return_mypoint_with_secondString() {
        let strings =  ["(-9,0)", "(10,10)"]
        configureTest(with: strings)
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==10 && point.y==10)
    }
    
    func testShapeFactory_createShape_outofrange_should_return_nil() {
        let strings =  ["(-9,10)"]
        configureTest(with: strings)
        let point = try? ShapeFactory.createShape(verticeProvider: provider)
        XCTAssertNil(point)
    }
    
    func testShapeFactory_createShape_should_throw_error() {
        let strings =  ["(-9,0)"]
        configureTest(with: strings)
        do {
            _ = try ShapeFactory.createShape(verticeProvider: provider)
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

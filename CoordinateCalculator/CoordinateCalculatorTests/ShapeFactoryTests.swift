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
        MockUserInputReader.pos = 0
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    lazy var provider: VertexProvidable = {
        let reader = MockUserInputReader()
        let parser = StringPointParser()
        return VertexProvider(reader: reader, parser: parser)
    }()
    
    func testShapeFactory_createShape_should_return_nil() {
        MockUserInputReader.inputs =  [""]
        let point = try? ShapeFactory.createShape(verticeProvider: provider)
        XCTAssertNil(point)
    }
    
    func testShapeFactory_createShape_should_return_mypoint() {
        MockUserInputReader.inputs =  ["(9,0)"]
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==9 && point.y==0)
    }
    
    func testShapeFactory_createShape_should_return_myline() {
        MockUserInputReader.inputs =  ["(9,0)-(20,20)"]
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let line = shape as? MyLine else {
            XCTFail()
            return
        }
        XCTAssertTrue(line.pointA.x == 9 && line.pointA.y == 0)
        XCTAssertTrue(line.pointB.x == 20 && line.pointB.y == 20)
    }

    func testShapeFactory_createShape_should_return_mytriangle() {
        MockUserInputReader.inputs =  ["(10,10)-(14,15)-(20,8)"]
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard (shape as? MyTriangle) != nil else {
            XCTFail()
            return
        }
    }
    
    func testShapeFactory_createShape_should_return_rectangle() {
        MockUserInputReader.inputs =  ["(10,10)-(22,10)-(22,18)-(10,18)"]
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard (shape as? MyRect) != nil else {
            XCTFail()
            return
        }
    }
    
    func testShapeFactory_createShape_should_return_mypoint_with_secondString() {
        MockUserInputReader.inputs =  ["(-9,0)", "(10,10)"]
        let shape = try? ShapeFactory.createShape(verticeProvider: provider)
        guard let point = shape as? MyPoint else {
            XCTFail()
            return
        }
        XCTAssertTrue(point.x==10 && point.y==10)
    }
    
    func testShapeFactory_createShape_outofrange_should_return_nil() {
        MockUserInputReader.inputs =  ["(-9,10)"]
        let point = try? ShapeFactory.createShape(verticeProvider: provider)
        XCTAssertNil(point)
    }
    
    
    func testShapeFactory_createShape_for_rect_should_throw_error() {
        MockUserInputReader.inputs =  ["(10,10)-(22,10)-(22,18)-(10,11)"]
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
        
        let point = try? ShapeFactory.createShape(verticeProvider: provider)
        XCTAssertNil(point)
    }
    
    
    func testShapeFactory_createShape_for_point_should_throw_error() {
        MockUserInputReader.inputs =  ["(-9,0)"]
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
}

//
//  UnitTestCC.swift
//  UnitTestCC
//
//  Created by rhino Q on 2018. 3. 27..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator
class UnitTestCC: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSpliterOnePointSuccess(){
        var spliter = Spliter()
        try! spliter.splitInRawPoint("(5,5)")
        let rawPoints = try! spliter.splitInRawPoints()
        XCTAssertEqual(rawPoints.count, 1, "Shoud be equal")
    }
    
    func testSpliterTwoPointSuccess(){
        var spliter = Spliter()
        try! spliter.splitInRawPoint("(1,1)-(2,2)")
        let rawPoints = try! spliter.splitInRawPoints()
        XCTAssertEqual(rawPoints.count, 2, "Shoud be equal")
    }
    
    func testSpliterThreePointSuccess(){
        var spliter = Spliter()
        try! spliter.splitInRawPoint("(1,1)-(2,2)-(3,3)")
        let rawPoints = try! spliter.splitInRawPoints()
        XCTAssertEqual(rawPoints.count, 3, "Shoud be equal")
    }
    
    func testSpliterFourPointSuccess(){
        var spliter = Spliter()
        try! spliter.splitInRawPoint("(1,1)-(2,2)-(3,3)-(4,4)")
        let rawPoints = try! spliter.splitInRawPoints()
        XCTAssertEqual(rawPoints.count, 4, "Shoud be equal")
    }
    
    func testSpliterInvalidFormatExceptionWithExceedNumber(){
        var spliter = Spliter()
        XCTAssertThrowsError(try spliter.splitInRawPoint("(25,25)")) { error in
            print(error.localizedDescription)
        }
    }
    
    func testSpliterInvalidFormatExceptionWithChracter(){
        var spliter = Spliter()
        XCTAssertThrowsError(try spliter.splitInRawPoint("(a,a)")) { error in
            print(error.localizedDescription)
        }
    }
    
    func testSpliterInvalidFormatExceptionWithHyphen(){
        var spliter = Spliter()
        XCTAssertThrowsError(try spliter.splitInRawPoint("(1-5)")) { error in
            print(error.localizedDescription)
        }
    }
    
    func testShapeCreaterPointSuccess(){
        let point = (5,5)
        let  myPoint = try! ShapeCreator().creatPoint([point])
        XCTAssert( myPoint is MyPoint, "Should be equal")
    }
    
    func testShapeCreaterLineSuccess(){
        let line = [(1,1),(2,2)]
        let myLine = try! ShapeCreator().creatPoint(line)
        XCTAssert( myLine is MyLine, "Should be equal")
    }
    
    func testShapeCreaterTriangleSuccess(){
        let triangle = [(1,1),(6,1),(3,3)]
        let myTriangle = try! ShapeCreator().creatPoint(triangle)
        XCTAssert( myTriangle is MyTriangle, "Should be equal")
    }
    
    func testShapeCreaterRectSuccess(){
        let rect = [(10,10),(22,10),(22,18),(10,18)]
        let myRect = try! ShapeCreator().creatPoint(rect)
        XCTAssert( myRect is MyRect, "Should be equal")
    }
    
    func testShapeCreaterRectIsNotRectangleException(){
        let rect = [(1,1),(6,1),(3,3),(7,7)]
        XCTAssertThrowsError(try ShapeCreator().creatPoint(rect)) { error in
            print(error.localizedDescription)
        }
    }
    
    func testShapeCreaterIsNotSupportException(){
        let fivePoints = [(1,1),(6,1),(3,3),(7,7),(5,4)]
        XCTAssertThrowsError(try ShapeCreator().creatPoint(fivePoints)) { error in
            print(error.localizedDescription)
        }
    }
}

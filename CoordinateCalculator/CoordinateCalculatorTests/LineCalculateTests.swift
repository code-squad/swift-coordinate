//
//  LineCaculteTests.swift
//  CoordinateCalculatorTests
//
//  Created by hoemoon on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class LineCalculateTests: XCTestCase {
	func test_WhenInputInvalidText_ThenThrowError1() {
		let invalidText = "(10,10)-=(14,15)"
		let result = try? Calculator.makeLine(from: invalidText)
		XCTAssertNil(result)
	}
	
	func test_WhenInputInvalidText_ThenThrowError2() {
		let invalidText = "(10,10,14,15)"
		let result = try? Calculator.makeLine(from: invalidText)
		XCTAssertNil(result)
	}
	
	func test_WhenValidInput_ThenCreateOne() throws {
		let validText = "(10,10)-(14,15)"
		let result = try Calculator.makeLine(from: validText)
		XCTAssertNotNil(result)
	}
	
	func test_WhenValidInput_ThenCreateOne2() throws {
		let validText = "(10,10)-(14,15)"
		let result = try Calculator.makeLine(from: validText)
		XCTAssert(result.pointA.x == 10)
		XCTAssert(result.pointB.y == 15)
	}

}


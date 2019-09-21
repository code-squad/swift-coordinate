//
//  CoordinateCalculatorTests.swift
//  CoordinateCalculatorTests
//
//  Created by hoemoon on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class CoordinateCalculatorTests: XCTestCase {
	func test_GivenCreatePoint_WhenInputInvalidText_ThenThrowError() {
		let invalidText = "xxxx"
		let point = try? MyPoint(from: invalidText)
		XCTAssertNil(point)
	}
	
	func test_GivenCreatePoint_WhenInputValidText_ThenCreateOne() throws {
		let validText = "(1,1)"
		let point = try MyPoint(from: validText)
		XCTAssertNotNil(point)
	}
	
	func test_GivenCreatePoint_WhenInputValidText_ThenValidOne() throws {
		let validText = "(10,20)"
		let point = try MyPoint(from: validText)
		XCTAssertEqual(point!, MyPoint(x: 10, y: 20))
	}
	
	func test_GivenCreatePoint_WhenInputLarge_ThenThrowError() {
		let point = try? MyPoint(from: "(99,88)")
		XCTAssertNil(point)
	}
	
	func test_GivenCreatePoint_WhenInputMinusValue_ThenThrowError() {
		let point = try? MyPoint(from: "(-99,-88)")
		XCTAssertNil(point)
	}

}

//
//  Calculator.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CalculatorError: Error {
	case failedToCreatePoint
}

struct Calculator {
	static func makePoint(from text: String) throws -> PointRepresentable {
		let matches = text.matches(regex: #"(\d+)"#)
		guard matches.count == 2 else {
			throw CalculatorError.failedToCreatePoint
		}
		guard let first = Int(matches[0]) else {
			throw CalculatorError.failedToCreatePoint
		}
		guard let second = Int(matches[1]) else {
			throw CalculatorError.failedToCreatePoint
		}
		guard 0 < first, 0 < second else {
			throw CalculatorError.failedToCreatePoint
		}
		guard first < 25, second < 25 else {
			throw CalculatorError.failedToCreatePoint
		}
		return MyPoint(x: first, y: second)
	}
	
	static func transform(_ point: PointRepresentable) -> PointRepresentable {
		let newY = 25 - point.y
		let newX = 3 + point.x * 2
		return MyPoint(x: newX, y: newY)
	}
}

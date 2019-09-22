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
	static func makePoint(from text: String) throws -> PointRepresentable? {
		return try MyPoint(from: text)
	}
	
	static func transform(_ point: PointRepresentable) -> PointRepresentable {
		let newY = 25 - point.y
		let newX = 3 + point.x * 2
		return MyPoint(x: newX, y: newY)
	}
}

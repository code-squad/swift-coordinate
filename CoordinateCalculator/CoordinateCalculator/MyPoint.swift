//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol PointRepresentable {
	var x: Int { get }
	var y: Int { get }
}

struct MyPoint: Comparable, PointRepresentable {
	static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	
	let x: Int
	let y: Int
	
	init?(from inputText: String) throws {
		let matches = inputText.matches(regex: #"(\d+)"#)
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
		x = first
		y = second
	}
	
	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}

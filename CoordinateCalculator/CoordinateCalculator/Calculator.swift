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
	case failedToCreateLine
	
	var message: String {
		switch self {
		case .failedToCreateLine:
			return "failed To Create Line"
		case .failedToCreatePoint:
			return "failed To Create Point"
		}
	}
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
	
	static func makeLine(from text: String) throws -> LineRepresentable {
		let matches = text.matches(regex: #"\(\d+\,\d+\)\-\(\d+\,\d+\)"#)
		guard matches.count == 1 else {
			throw CalculatorError.failedToCreateLine
		}
		let numbers = text.matches(regex: #"(\d+)"#)
			.compactMap { Int($0) }
		guard numbers.count == 4 else {
			throw CalculatorError.failedToCreateLine
		}
		return MyLine(
			pointA: MyPoint(x: numbers[0], y: numbers[1]),
			pointB: MyPoint(x: numbers[2], y: numbers[3])
		)
	}
		
	static func transform(_ displayable: Displayable) -> Displayable {
		switch displayable {
		case let pointRepresentable as PointRepresentable:
			return transform(pointRepresentable)
		case let lineRepresentable as LineRepresentable:
			let first = MyPoint(
				x: transform(point: lineRepresentable.pointA).x,
				y: transform(point: lineRepresentable.pointA).y
			)
			let second = MyPoint(
				x: transform(point: lineRepresentable.pointB).x,
				y: transform(point: lineRepresentable.pointB).y
			)
			return MyLine(pointA: first, pointB: second)

		default:
			fatalError()
		}
	}
	
	private static func transform(point: PointRepresentable) -> PointRepresentable {
		let newY = 25 - point.y
		let newX = 3 + point.x * 2
		return MyPoint(x: newX, y: newY)
	}
}

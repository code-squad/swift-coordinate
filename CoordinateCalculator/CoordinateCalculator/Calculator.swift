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
	case failedToCreateTriangle
	case wrongInput
	
	var message: String {
		switch self {
		case .failedToCreateLine:
			return "failed To Create Line"
		case .failedToCreatePoint:
			return "failed To Create Point"
		case .failedToCreateTriangle:
			return "failed To Create Triangle"
		case .wrongInput:
			return "wrong input"
		}
	}
}

struct Calculator {
	static func makeDisplayable(from text: String) throws -> Displayable {
		if let point = try? makePoint(from: text) {
			return point
		} else
		if let line = try? makeLine(from: text) {
			return line
		}
		if let triangle = try? makeTriangle(from: text) {
			return triangle
		}
		throw CalculatorError.wrongInput
	}
	
	static func transform(_ displayable: Displayable) -> Displayable {
		switch displayable {
		case let point as PointRepresentable:
			return point.transformed
		case let line as LineRepresentable:
			return MyLine(
				pointA: line.pointA.transformed,
				pointB: line.pointB.transformed
			)
		case let triangle as TriangleRepresentable:
			return MyTriangle(
				pointA: triangle.pointA.transformed,
				pointB: triangle.pointB.transformed,
				pointC: triangle.pointC.transformed
			)
		default:
			fatalError()
		}
	}
}

extension Calculator {
	static private func makePoint(from text: String) throws -> PointRepresentable {
		let matches = text.matches(regex: #"(\d+)"#)
		guard matches.count == 2 else {
			throw CalculatorError.failedToCreatePoint
		}
		guard text.numbers.count == 2 else {
			throw CalculatorError.failedToCreatePoint
		}
		return MyPoint(x: text.numbers[0], y: text.numbers[1])
	}
	
	static private func makeLine(from text: String) throws -> LineRepresentable {
		let matches = text.matches(regex: #"\(\d+\,\d+\)\-\(\d+\,\d+\)"#)
		guard matches.count == 1 else {
			throw CalculatorError.failedToCreateLine
		}
		guard text.numbers.count == 4 else {
			throw CalculatorError.failedToCreateLine
		}
		return MyLine(
			pointA: MyPoint(x: text.numbers[0], y: text.numbers[1]),
			pointB: MyPoint(x: text.numbers[2], y: text.numbers[3])
		)
	}
	
	static private func makeTriangle(from text: String) throws -> TriangleRepresentable {
		let matches = text.matches(regex: #"\(\d+\,\d+\)\-\(\d+\,\d+\)-\(\d+\,\d+\)"#)
		guard matches.count == 1 else {
			throw CalculatorError.failedToCreateTriangle
		}
		let numbers = text.numbers
		guard numbers.count == 6 else {
			throw CalculatorError.failedToCreateTriangle
		}
		return MyTriangle(
			pointA: MyPoint(x: numbers[0], y: numbers[1]),
			pointB: MyPoint(x: numbers[2], y: numbers[3]),
			pointC: MyPoint(x: numbers[4], y: numbers[5])
		)
	}
	
	private static func transform(point: PointRepresentable) -> PointRepresentable {
		let newY = 25 - point.y
		let newX = 3 + point.x * 2
		return MyPoint(x: newX, y: newY)
	}
}

extension String {
	var numbers: [Int] {
		return self.matches(regex: #"(\d+)"#)
			.compactMap { Int($0) }
			.filter { $0 < 25 && $0 > 0 }
	}
}

extension PointRepresentable {
	var transformed: PointRepresentable {
		let newY = 25 - self.y
		let newX = 3 + self.x * 2
		return MyPoint(x: newX, y: newY)
	}
}

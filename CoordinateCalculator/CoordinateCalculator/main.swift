//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("Hello, World!")

struct InputView {
	static func readInput() -> String {
		guard let rawInput = readLine() else {
			fatalError()
		}
		return rawInput
	}
}

enum CalculatorError: Error {
	case failedToCreatePoint
}

extension String {
	func matches(regex: String) -> [String] {
		guard let regex = try? NSRegularExpression(pattern: regex) else {
			fatalError()
		}
		let results = regex.matches(
			in: self,
			range: NSRange(self.startIndex..., in: self)
		)
		return results.map {
				String(self[Range($0.range, in: self)!])
		}
	}
}

struct MyPoint: Comparable {
	static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	
	let x: Int
	let y: Int
	
	init?(from inputText: String) throws {
		let pattern = #"^\(\d+\,\d+\)$"#
		guard inputText.range(of: pattern, options: .regularExpression) != nil else {
			throw CalculatorError.failedToCreatePoint
		}
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

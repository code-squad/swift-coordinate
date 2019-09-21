//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
	static func readInput() -> String {
		print("좌표를 입력하시오.")
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

protocol PointRepresentable {
	var x: Int { get }
	var y: Int { get }
}

struct OutputView {
	static func display(_ point: PointRepresentable) {
		print("결과 출력")
		print("\(ANSICode.clear)\(ANSICode.home)")
		print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
	}
}

var outPoint: MyPoint! = nil

while true {
	let input = InputView.readInput()
	guard let point = try? MyPoint(from: input) else {
		print("잘못된 입력")
		continue
	}
	outPoint = point
	break
}

OutputView.display(outPoint)

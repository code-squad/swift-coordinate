//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
	static func display(_ point: PointRepresentable) {
		let pointANSI = ANSICode.makePoint(
			geometry: point,
			symbol: "😈"
		)
		display(with: pointANSI)
	}
	
	static func display(line: LineRepresentable, distance: Double) {
		let lineANSI = ANSICode.makeLine(
			geometry: line,
			firstSymbol: "😈",
			secondSymbol: "👻"
		)
		display(with: lineANSI)
		print("두 점 사이의 거리는 \(distance)")
	}
	
	private static func display(with string: String) {
		print("\(ANSICode.clear)\(ANSICode.home)")
		print(string)
		print("\(ANSICode.text.white)\(ANSICode.axis.draw())")
	}
}

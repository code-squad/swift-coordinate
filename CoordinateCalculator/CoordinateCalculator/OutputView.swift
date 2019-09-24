//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Displayable {
	
}

struct OutputView {
	static func display(_ displayable: Displayable) {
		switch displayable {
		case let pointRepresentable as PointRepresentable:
					let pointANSI = ANSICode.makePoint(
				geometry: pointRepresentable,
				symbol: "😈"
			)
			display(with: pointANSI)
		case let lineRepresentable as LineRepresentable:
			let lineANSI = ANSICode.makeLine(
				geometry: lineRepresentable,
				firstSymbol: "😈",
				secondSymbol: "👻"
			)
			display(with: lineANSI)
			print("두 점 사이의 거리는 \(lineRepresentable.distance)")
		default:
			fatalError()
		}
	}
	
	private static func display(with string: String) {
		print("\(ANSICode.clear)\(ANSICode.home)")
		print(string)
		print("\(ANSICode.text.white)\(ANSICode.axis.draw())")
	}
}

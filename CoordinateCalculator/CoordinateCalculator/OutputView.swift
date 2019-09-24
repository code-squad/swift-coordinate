//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Displayable {
	var points: [PointRepresentable] { get }
}

struct OutputView {
	static func display(_ displayable: Displayable) {
		switch displayable {
		case let point as PointRepresentable:
			let pointANSI = ANSICode.makeFigure(
				displayable: point,
				symbols: ["😈"]
			)
			display(with: pointANSI)
		case let line as LineRepresentable:
			let lineANSI = ANSICode.makeFigure(
				displayable: line,
				symbols: ["😈", "👻"]
			)
			display(with: lineANSI)
			print("두 점 사이의 거리는 \(line.distance)")
		case let triangle as TriangleRepresentable:
			let triangleANSI = ANSICode.makeFigure(
				displayable: triangle,
				symbols: ["😈", "👻", "🤑"]
			)
			display(with: triangleANSI)
			print("삼각형 넓이는 \(triangle.area)")
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

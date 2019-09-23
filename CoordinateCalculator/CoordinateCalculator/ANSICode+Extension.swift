//
//  ANSICode+Point.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension ANSICode {
	static func makePoint(geometry: PointRepresentable, symbol: String) -> String {
		var point = ANSICode.cursor.move(row:geometry.y, col: geometry.x)
		point += symbol
		return point
	}
	
	static func makeLine(
		geometry: LineRepresentable,
		firstSymbol: String,
		secondSymbol: String) -> String {
		
		var point = makePoint(geometry: geometry.pointA, symbol: firstSymbol)
		point += makePoint(geometry: geometry.pointB, symbol: secondSymbol)
		return point
	}
}


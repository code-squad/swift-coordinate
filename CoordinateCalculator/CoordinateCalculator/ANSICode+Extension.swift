//
//  ANSICode+Point.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension ANSICode {
	private static func makePoint(geometry: PointRepresentable, symbol: String) -> String {
		var point = ANSICode.cursor.move(row:geometry.y, col: geometry.x)
		point += symbol
		return point
	}
	
	static func makeFigure(
		displayable: Displayable,
		symbols: [String]) -> String {
		
		var result = ""
		for (index, point) in displayable.points.enumerated() {
			result += makePoint(geometry: point, symbol: symbols[index])
		}
		return result
	}
}


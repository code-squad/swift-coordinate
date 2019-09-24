//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol LineRepresentable: Displayable {
	var pointA: PointRepresentable { get }
	var pointB: PointRepresentable { get }
	var points: [PointRepresentable] { get }
	var distance: Double { get }
}

struct MyLine: LineRepresentable, Equatable {
	static func == (lhs: MyLine, rhs: MyLine) -> Bool {
		return lhs.pointA.hash == rhs.pointA.hash
			&& lhs.pointB.hash == rhs.pointB.hash
	}
	let pointA: PointRepresentable
	let pointB: PointRepresentable
	
	var distance: Double {
		let xDistance = Double(pointA.x - pointB.x)
		let yDistance = Double(pointA.y - pointB.y)
		return (xDistance * xDistance + yDistance * yDistance).squareRoot()
	}
	
}

extension MyLine: Displayable {
	var points: [PointRepresentable] {
		return [pointA, pointB]
	}
}

extension MyLine {
	static var empty: MyLine {
		MyLine(pointA: MyPoint.empty, pointB: MyPoint.empty)
	}
}

//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol TriangleRepresentable: Displayable {
	var pointA: PointRepresentable { get }
	var pointB: PointRepresentable { get }
	var pointC: PointRepresentable { get }
	
	var area: Double { get }
}

struct MyTriangle: TriangleRepresentable, Equatable {
	static func == (lhs: MyTriangle, rhs: MyTriangle) -> Bool {
		return lhs.pointA.hash == rhs.pointA.hash
			&& lhs.pointB.hash == rhs.pointB.hash
			&& lhs.pointC.hash == rhs.pointC.hash
	}
	
	var pointA: PointRepresentable
	var pointB: PointRepresentable
	var pointC: PointRepresentable
	
	var area: Double {
		return lineA.distance * lineC.distance * sinB / 2
	}
	var points: [PointRepresentable] {
		return [pointA, pointB, pointC]
	}
}

extension MyTriangle {
	private var lineA: LineRepresentable {
		return MyLine(pointA: pointA, pointB: pointB)
	}
	private var lineB: LineRepresentable {
		return MyLine(pointA: pointB, pointB: pointC)
	}
	private var lineC: LineRepresentable {
		return MyLine(pointA: pointC, pointB: pointA)
	}
	
	private var cosB: Double {
		let top = lineA.distance * lineA.distance
			+ lineC.distance * lineC.distance
			- lineB.distance * lineB.distance
		let bottom = 2 * lineA.distance * lineC.distance
		return top / bottom
	}
	
	private var sinB: Double {
		return (1 - cosB * cosB).squareRoot()
	}
}

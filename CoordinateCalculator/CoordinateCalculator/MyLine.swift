//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol LineRepresentable: Displayable {
	var pointA: MyPoint { get }
	var pointB: MyPoint { get }
	var distance: Double { get }
}

struct MyLine: LineRepresentable, Equatable {
	let pointA: MyPoint
	let pointB: MyPoint
	
	var distance: Double {
		let xDistance = Double(pointA.x - pointB.x)
		let yDistance = Double(pointA.y - pointB.y)
		return (xDistance * xDistance + yDistance * yDistance).squareRoot()
	}
}

extension MyLine {
	static var empty: MyLine {
		MyLine(pointA: .empty, pointB: .empty)
	}
}

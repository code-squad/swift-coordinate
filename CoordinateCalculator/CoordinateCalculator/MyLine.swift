//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol LineRepresentable {
	var pointA: MyPoint { get }
	var pointB: MyPoint { get }
}

struct MyLine: LineRepresentable {
	let pointA: MyPoint
	let pointB: MyPoint
}

extension MyLine: Equatable {}

extension MyLine {
	static var empty: MyLine {
		MyLine(pointA: .empty, pointB: .empty)
	}
}

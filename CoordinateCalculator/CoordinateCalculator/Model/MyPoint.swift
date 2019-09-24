//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol PointRepresentable: Displayable {
	var x: Int { get }
	var y: Int { get }
}

extension PointRepresentable {
	var hash: Int {
		return x.hashValue * y.hashValue
	}
}

struct MyPoint: PointRepresentable {
	let x: Int
	let y: Int
		
	init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
	
	var points: [PointRepresentable] {
		return [self]
	}
}

extension MyPoint: Comparable {
	static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
}

extension MyPoint {
	static var empty: PointRepresentable {
		return MyPoint(x: 0, y: 0)
	}
}

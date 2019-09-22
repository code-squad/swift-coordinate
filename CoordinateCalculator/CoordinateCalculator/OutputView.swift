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
		print("\(ANSICode.clear)\(ANSICode.home)")
		print(ANSICode.makePoint(geometry: Calculator.transform(MyPoint(x: 10, y: 10)), symbol: "😈"))
		print("\(ANSICode.text.white)\(ANSICode.axis.draw())")
	}
}

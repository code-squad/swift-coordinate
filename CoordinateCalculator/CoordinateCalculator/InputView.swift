//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
	static func readPointInput() -> String {
		print("좌표를 입력하시오.")
		guard let rawInput = readLine() else {
			fatalError()
		}
		return rawInput
	}
	static func readLineInput() -> String {
		return readPointInput()
	}
}


//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by hoemoon on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
	enum Message {
		static let input = "좌표를 입력하시오."
	}
	static func readInput() -> String {
		print(Message.input)
		guard let rawInput = readLine() else {
			fatalError()
		}
		return rawInput
	}
}


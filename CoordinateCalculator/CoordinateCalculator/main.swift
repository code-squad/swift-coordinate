//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
	while true {
		let input = InputView.readInput()
		guard let point = try? Calculator.makePoint(from: input) else {
			print("잘못된 입력")
			continue
		}
		let transformed = Calculator.transform(point!)
		OutputView.display(transformed)
		break
	}
}

main()

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
		do {
			let result = try Calculator.makeLine(from: input)
			let transformed = Calculator.transform(result)
			OutputView.display(transformed)
			break
		} catch let e {
			let calculatorError = e as? CalculatorError
			print(calculatorError?.message ?? "unkown error")
		}
	}
}

main()

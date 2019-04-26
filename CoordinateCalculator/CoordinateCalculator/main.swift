//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
        let input = InputView().readInput()
        guard let passedPoint = Inspection(item: input).point() else { return }
        OutputView.mark(at: passedPoint)
        return
}

main()


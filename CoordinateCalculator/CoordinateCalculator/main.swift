//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    let verifier = InputVerifier()
    let inputView = InputView(verifier: verifier)
    
    guard let point = inputView.readInput() else {
        print("wrong input")
        return
    }

    OutputView.drawAxis()
    OutputView.draw(with: point)
    OutputView.finishingOperation()
    
    //print(point) for debug
}

main()


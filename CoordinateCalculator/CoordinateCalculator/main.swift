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
    
    guard let coordinated = inputView.readInput() else {
        print("wrong input")
        return
    }
    
    let outputView = OutputView()
    coordinated.draw(outView: outputView)
    let areaSize = coordinated.calculateArea()
    coordinated.printResult(outView: outputView, area: areaSize)
    
    //print(point) for debug
}

main()


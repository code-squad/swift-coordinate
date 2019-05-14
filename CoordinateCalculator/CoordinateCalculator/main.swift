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
        let validator = Validator()
        let inputs = InputView.readInput(Question.request)
        do {
            let coordinates = try inputs.map { try validator.validateFormat(input: $0) }
            let points = coordinates.map { Converter.makePoint(pointArray: $0) }
            switch points.count {
                case 1:
                    OutputView.draw(points[0])
                case 2:
                    let line = Converter.makeLine(pointArray: points)
                    OutputView.draw(line)
            default:
                break
            }
            
        } catch {
            print(error)
        }
    }
}

main()

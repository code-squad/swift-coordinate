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
        
        let inputs = InputView.readInput(Question.request)
        do {
            let coordinates = try inputs.map { try Converter.validateFormat(input: $0) }
            let points = coordinates.map { Converter.makePoint(pointArray: $0) }
            switch points.count {
            case 1:
                OutputView.drawPoint(points[0])
            case 2:
                let line = Converter.makeLine(pointArray: points)
                OutputView.drawLine(line)
                
            default:
                break
            }
            
        } catch {
            print(error)
        }
    }
}

main()

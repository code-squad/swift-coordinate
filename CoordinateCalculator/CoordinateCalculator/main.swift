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
        do {
            let inputs = try InputView.readInputs()
            let coordinates = try inputs.map { try Converter.ConvertInput(input: $0) }
            let points = try coordinates.map { try Converter.makePoint(pointArray: $0) }
            try Converter.classifyInput(points: points)
        } catch {
            print(error)
        }
    }
}

main()

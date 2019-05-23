//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    var isError = false
    repeat {
        do {
            let inputs = try InputView.readInputs()
            
            let coordinates = try inputs.map { try Converter.ConvertInput(input: $0) }
            let points = try coordinates.map { try Factory.makePoint(pointArray: $0) }
            let classifyPoint = try Converter.classifyInput(points: points)
            
            OutputView.draw(classifyPoint)
            
            isError = false
        } catch let error as Error.Type {
            print(error)
            isError = true
        } catch {
            print(error)
            isError = true
        }
    } while isError
}

main()

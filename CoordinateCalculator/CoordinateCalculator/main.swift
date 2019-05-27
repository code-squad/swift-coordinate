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
            let coordinates = try Converter.converts(inputs: inputs)
            let classifyPoint = try Factory.classifyInput(coordinates: coordinates)
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

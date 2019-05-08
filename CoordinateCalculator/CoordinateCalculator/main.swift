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
            let coordinates = try InputView.readInput()
            
            let shape = try Converter.shape(coordinates: coordinates)
            
            OutputView.drawAxis()
            OutputView.draw(shape: shape)
            
            break
        } catch let error as InputError {
            print(error.localizedDescription)
            continue
        } catch {
            print(error)
            continue
        }
    }
}

main()

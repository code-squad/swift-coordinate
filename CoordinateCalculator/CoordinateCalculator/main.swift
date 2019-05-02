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
            let coordinatesTexts = try InputView.readInput()
            
            let shape = try Converter.convertCoordinates(coordinatesTexts: coordinatesTexts)
            
            OutputView.drawAxis()
            OutputView.draw(shape: shape)
            
            break
        } catch let error as InputError {
            print(error.localizedDescription)
            continue
        } catch {
            print("알 수 없는 에러")
            continue
        }
    }
}

main()

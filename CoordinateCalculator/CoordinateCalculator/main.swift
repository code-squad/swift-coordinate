//
//  main.swift
//  CoordinateCalculator
//
//  Created by Joon-ho Kil on 04/17/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

//MARK: Function
func main () {
    let outputView = OutputView()
    var inputView = InputView()
    var pointCoordinate = MyPoint()
    
    while true {
        inputView.readInput()
        do {
            try pointCoordinate.inputToCoordinate(inputView)
            break
        }
        catch InputError.NonInputStandard {
            print("소괄호로 둘러싸인 x,y 좌표를 정확히 입력해주세요. ex: (4,16)")
        }
        catch InputError.NonCoordinateStandard {
            print("x,y 좌표는 0부터 24까지 입력해주세요.")
        }
        catch {
            print("입력값을 확인해주세요.")
        }
    }
    
    outputView.drawAxis()
    outputView.drawPoint(pointCoordinate)
}

main()


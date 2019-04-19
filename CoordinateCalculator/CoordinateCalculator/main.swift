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
    var figure: Any!
    
    while true {
        inputView.readInput()
        do {
            figure = try Converter.inputToFigure(inputView.valueEntered)
            break
        }
        catch let error as InputError {
            print(error.rawValue)
        }
        catch {
            print("알 수 없는 오류입니다. 입력값을 확인해주세요.")
        }
    }
    
    outputView.drawAxis()
    
    if figure is MyPoint {
        outputView.drawPoint(figure as! MyPoint)
    } else if figure is MyLine {
        outputView.drawLine(figure as! MyLine)
    }
    
}

main()


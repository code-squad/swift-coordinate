//
//  main.swift
//  coordinateCalculator
//
//  Created by JINA on 27/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

func main() {
    while true {
        let input = InputView.readInput()
        let number = Check.getNum(input)
       
        if Check.checkChar(input), Check.checkParenthesis(input), Check.checkNumRange(number) == true {
            let figure = Check.getFigureValue(number)
            outputView.drawPoints(figure)
        } else {
            print("다시 입력해주세요")
        }
    }
}
main()

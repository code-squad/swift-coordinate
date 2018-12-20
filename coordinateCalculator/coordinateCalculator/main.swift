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
        let number = FigureCreate.number(of: input)
       
        if CheckInput.isInputable(input), CheckInput.hasParenthesis(input), CheckInput.isWhitinRange(number), CheckInput.canBecomeFigure(number) == true {
            let figure = FigureCreate.createFigure(number)
            outputView.drawFigure(figure)
        } else {
            print("다시 입력해주세요")
        }
    }
}

main()

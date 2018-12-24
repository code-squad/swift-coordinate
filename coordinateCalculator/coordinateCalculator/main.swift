//
//  main.swift
//  coordinateCalculator
//
//  Created by JINA on 27/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation
struct main {
    static var run = true
    
    static func coordinateCalculator() {
        let input = InputView.readInput()
        let number = FigureCreate.number(of: input)
        
        if CheckInput.isInputable(input), CheckInput.hasParenthesis(input), CheckInput.isWhitinRange(number), CheckInput.canBecomeFigure(number) == true {
            guard let figure = FigureCreate.createFigure(number) else {return}
            outputView.drawFigure(figure)
        } else {
            outputView.printErrorMessage(errorMessage: .reEntered)
        }
        run = false
    }
}

while(main.run) {
    main.coordinateCalculator()
}


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
        
        guard CheckInput.validData(input, number) == true else {
            return outputView.printErrorMessage(errorMessage: .reEntered)
        }
        guard let figure = FigureCreate.createFigure(number) else {return}
        outputView.drawFigure(figure)
        run = false
    }
}

while(main.run) {
    main.coordinateCalculator()
}


//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    
    let inputChecker = InputChecker()
    var inputErrorFlag = true
    var userInput: String = ""
    
    while inputErrorFlag {
        
        userInput = InputView.readInput(question: Question.coordinate.rawValue)
        
        // 입력 없을 경우 다시 받기
        if userInput.isEmpty {
            continue
        }
        
        // 입력되지 않은 문자가 있을 경우 다시 입력받기
        if !InputView.hasInvalidCharacter(in: userInput) {
            inputErrorFlag = false
        }

        do {
            // 패턴 매칭이 안될경우 다시 입력받기
            if try !InputChecker.checkMatching(text: userInput) {
                inputErrorFlag = false
            }
        } catch let error as InputError {
            print(error.localizedDescription)
        } catch {
            print("Unexpected Error")
            return
        }
    }
    
    let myPoints: [MyPoint] = inputChecker.getMyPoints(userInput)
    let figureFactory = FigureFactory(myPoints)
    let figure: Figure = figureFactory.makeFigure()
    
    print("\(ANSICode.clear)\(ANSICode.home)")
    
    let outputView = OutputView(figure)
    outputView.drawFigure()
    outputView.drawAxis()
    outputView.printDescription()
}

main()



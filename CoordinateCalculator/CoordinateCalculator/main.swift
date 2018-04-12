//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    
    var inputErrorFlag = true
    var userInput: String = ""
    
    while inputErrorFlag {
        userInput = InputView.readInput(question: Question.coordinate.rawValue)
        
        // 입력이 없거나, 지정한 문자 외에 입력이 있을 경우 다시 입력받기
        if userInput.isEmpty || InputView.hasInvalidCharacter(in: userInput) {
            continue
        }
        
        do {
            // 패턴 매칭이 안될경우 다시 입력받기
            if try InputChecker.hasInvalidPattern(text: userInput) {
                continue
            }
            inputErrorFlag = false
        } catch let error as InputError {
            print(error.localizedDescription)
        } catch {
            print("Unexpected Error")
            return
        }
    }
    
    let myPoints: [MyPoint] = FigureFactory.makeMyPoints(userInput)
    let figure: Figure = FigureFactory.makeFigure(myPoints)
    let outputView = OutputView(figure)
    
    print("\(ANSICode.clear)\(ANSICode.home)")
    
    outputView.drawFigure()
    OutputView.drawAxis()
    
    if let figure = figure as? FigureCalculatable {
        OutputView.printDistance(figure)
    }
}

main()



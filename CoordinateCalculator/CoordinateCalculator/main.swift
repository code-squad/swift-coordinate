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
    let outputView = OutputView()
    let firgureMaker = FigureMaker()
    
    var errorFlag = true
    
    while errorFlag {
        do {
            let text: String = InputView.readInput(question: Question.coordinate.rawValue)
            let coordinateText: String = try inputChecker.checkMatching(text: text, with: InputChecker.validPattern)
            let coordinates: [Int] = firgureMaker.getCoordinateFrom(text: coordinateText)
            let point: MyPoint = firgureMaker.makeMyPointFrom(coordinates: coordinates)
            
            print("\(ANSICode.clear)\(ANSICode.home)")
            outputView.drawPoint(point)
            outputView.drawAxis()
            
            errorFlag = false
            
        } catch let error as InputError {
            print(error.localizedDescription)
            continue
        } catch {
            fatalError("Unexpected Error")
        }
    }
}

main()



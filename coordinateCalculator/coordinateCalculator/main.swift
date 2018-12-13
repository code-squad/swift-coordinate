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
while true {
    func getPoint() {
        let input = InputView.readInput()
        let point = Check.getNum(input)
        outputView().printPoint(point)
    }
    
    func main(_ input: String){
        if Check.checkInput(input) == true {
            getPoint()
        } else {
            print("입력 형식은 (x,y) 입니다. 다시 입력해주세요")
            getPoint()
        }
    }
    main(InputView.readInput())
}
//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func checkQuit(_ input:String) {
    if input == "q"{
        print("종료합니다")
        exit(0)
    }
}

while true {
    do {
        let input = try InputView.readInput(question: "좌표를 입력해주세요! 형식 : (5,5)")
        
        checkQuit(input)
        
        let (x,y) = try Spliter.split(input)
        
        let myPoint = PointCreator.creatPoint(x: x, y: y)
        
        OutputView.clean()
        OutputView.drawPoint(at: myPoint)
        OutputView.drawAxis()
        
    } catch let error{
        print("\(error.localizedDescription)")
    }
}

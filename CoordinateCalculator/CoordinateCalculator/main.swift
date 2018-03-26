//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Points = [(x:Int,y:Int)]

func checkQuit(_ input:String) {
    if input == "q"{
        print("종료합니다")
        exit(0)
    }
}

while true {
    do {
        let input = try InputView.readInput(question: "좌표를 입력해주세요! 형식 : (5,5) 또는 (1,1)-(2,2)")
        
        checkQuit(input)
        
        var spliter = Spliter()
        try spliter.splitInRawPoint(input)
        let rawPoints = try spliter.splitInRawPoints()
        
        let shape = try ShapeCreator().creatPoint(rawPoints)
        
        OutputView.clean()
        OutputView.drawPoints(at: shape)
        OutputView.drawAxis()
        OutputView.result(of: shape)
        
    } catch let error{
        print("\(error.localizedDescription)")
    }
}

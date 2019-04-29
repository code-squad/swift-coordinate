//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


typealias PointTuple = (x:Int,y:Int)

struct InputView{
    
    enum Question : String{
        case aboutCoordinate  = "좌표를 입력하세요."
    }
    
    private func ask(_ question:Question) throws -> Answer {
        print(question.rawValue)
        guard let input = readLine() else {
            throw Exception.ErrorType.wrongFormat
        }
        return  Answer.init(input)
    }
    
    public func readInput() throws -> Answer {
        let anwser = try ask(Question.aboutCoordinate)
        return anwser
    }
}


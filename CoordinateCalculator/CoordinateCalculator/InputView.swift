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
    private func makeMyPoint(_ answer:Answer) throws ->(MyPoint){
        let point =  try answer.getPointTuple()
        return try MyPoint(point)
    }
    public func readInput() throws -> MyPoint {
        let anwser = try ask(Question.aboutCoordinate)
        guard anwser.isCoordinateFormat() else {
            throw Exception.ErrorType.wrongFormat
        }
        return try makeMyPoint(anwser)
    }
}


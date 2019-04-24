//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct InputView{
    
    enum Question : String{
        case aboutCoordinate  = "좌표를 입력하세요."
    }

    func readInput() throws {
        let anwser = try ask(Question.aboutCoordinate)
    }
    
    func ask(_ question:Question) throws -> String {
        print(question.rawValue)
        guard let anwser = readLine() else {
            throw Exception.ErrorType.wrongFormat
        }
        return anwser
    }
    
   
}


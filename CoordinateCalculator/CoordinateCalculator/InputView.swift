//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias StringPoint = (String,String)

struct InputView{
    
    enum Question : String{
        case aboutCoordinate  = "좌표를 입력하세요."
    }
    
    func readInput() throws {
        let anwser = try ask(Question.aboutCoordinate)
        anwser.isCorrectFormat()
        let point = try anwser.getPointValue()
        print(point)
    }
    
    func ask(_ question:Question) throws -> String {
        print(question.rawValue)
        guard let anwser = readLine() else {
            throw Exception.ErrorType.wrongFormat
        }
        return anwser
    }
    
    
}

extension String{
    func isCorrectFormat() throws ->(Bool){
        guard let regex = try? NSRegularExpression.init(pattern: "^([0-9,]+)", options: []) else {
            return false
        }
        
       return true
    }
    
    func getPointValue() throws -> StringPoint {
        guard let regex = try? NSRegularExpression.init(pattern: "[0-9]+", options: []) else {
            throw Exception.ErrorType.wrongFormat
        }
        let matchs = regex.matches(in: self, options: [], range: NSRange.init(location: 0, length: self.count))
        let x = NSString.init(string:self).substring(with: (matchs[0].range))
        let y = NSString.init(string:self).substring(with: (matchs[1].range))
        return (x,y)
    }
    
    func checkRange(){}
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


typealias PointTuple = (Int,Int)

struct InputView{
    
    enum Question : String{
        case aboutCoordinate  = "좌표를 입력하세요."
    }
    
    func readInput() throws -> MyPoint {
        let anwser = try ask(Question.aboutCoordinate)
        let check = anwser.isCorrectFormat()
        let point =  try anwser.getPointTuple()
        return MyPoint(point)
    }
    
    func ask(_ question:Question) throws -> Answer {
        print(question.rawValue)
        guard let anwser = readLine() else {
            throw Exception.ErrorType.wrongFormat
        }
        return anwser
    }
    
    
}
typealias Answer = String
extension Answer{
    func isCorrectFormat()->(Bool){
        guard let regex = try? NSRegularExpression.init(pattern: "^[(]", options: []) else {
            return false
        }
        let result =  regex.matches(in: self, options: [], range: NSRange.init(location: 0, length: self.count))
        return result.count == 0 ? false : true
    }
    func getPointTuple() throws -> PointTuple {
        guard let regex = try? NSRegularExpression.init(pattern: "[0-9]+", options: []) else {
            throw Exception.ErrorType.wrongFormat
        }
        let matchs = regex.matches(in: self, options: [], range: NSRange.init(location: 0, length: self.count))
        let x = NSString.init(string:self).substring(with: (matchs[0].range))
        let y = NSString.init(string:self).substring(with: (matchs[1].range))
        return (try x.stringToInt(),try y.stringToInt())
    }
    func stringToInt() throws -> Int{
        guard let intValue = Int(self) else {
            throw Exception.ErrorType.wrongFormat
        }
        return intValue
        
    }
}

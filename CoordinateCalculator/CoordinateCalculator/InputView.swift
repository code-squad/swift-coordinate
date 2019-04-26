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
struct Answer{
    private let contents :String
    init(_ contents:String) {
        self.contents = contents
    }
    func isCoordinateFormat()->(Bool){
        guard let regex = try? NSRegularExpression.init(pattern: "\\([0-9]+,[0-9]+\\)", options: []) else {
            return false
        }
        let result =  regex.matches(in: self.contents, options: [], range: NSRange.init(location: 0, length: self.contents.count))
        return result.count == 0 ? false : true
    }
    func getPointTuple() throws -> PointTuple {
        guard let regex = try? NSRegularExpression.init(pattern: "[0-9]+", options: []) else {
            throw Exception.ErrorType.wrongFormat
        }
        let matchs = regex.matches(in: self.contents, options: [], range: NSRange.init(location: 0, length: self.contents.count))
        let x = NSString.init(string:self.contents).substring(with: (matchs[0].range))
        let y = NSString.init(string:self.contents).substring(with: (matchs[1].range))
        return (try x.stringToInt(), try y.stringToInt())
    }
}
extension String{
    func stringToInt() throws -> Int{
        guard let intValue = Int(self) else {
            throw Exception.ErrorType.wrongFormat
        }
        return intValue
    }
}


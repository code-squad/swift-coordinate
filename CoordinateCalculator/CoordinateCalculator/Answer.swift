//
//  Answer.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Answer{
    
    enum CoordinateFormat : Int{
        static let separator = "-"
        case point = 1
        case line
    }
    
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
    func getFormat() throws ->CoordinateFormat{
        let points = self.contents.components(separatedBy:CoordinateFormat.separator ).filter{
            return Answer.init($0).isCoordinateFormat()
        }
        guard let coordinateFormat = CoordinateFormat.init(rawValue: points.count) else {
            throw Exception.ErrorType.wrongFormat
        }
        return coordinateFormat
    }
}

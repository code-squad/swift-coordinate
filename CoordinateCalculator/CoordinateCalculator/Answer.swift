//
//  Answer.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct Answer{
    private let contents :String
    let separator = "-"
    
    init(_ contents:String){
        self.contents = contents
    }
    
    public func isCoordinateFormat() -> (Bool){
        guard let regex = try? NSRegularExpression.init(pattern: "\\([0-9]+,[0-9]+\\)", options: []) else {
            return false
        }
        let result =  regex.matches(in: self.contents, options: [], range: NSRange.init(location: 0, length: self.contents.count))
        return result.count == 0 ? false : true
    }
    
    public func getPointTuples() throws -> [PointTuple]{
        let points = self.contents.components(separatedBy:self.separator )
        let varifiedPoints = getVerifiedPoints(points: points)
        let pointTuples = try varifiedPoints.map{
            try getPointTuple(string: $0)
        }
        return pointTuples
    }
    
    private func getPointTuple(string:String) throws -> PointTuple {
        guard let regex = try? NSRegularExpression.init(pattern: "[0-9]+", options: []) else {
            throw Exception.ErrorType.wrongFormat
        }
        let matchs = regex.matches(in: string, options: [], range: NSRange.init(location: 0, length: string.count))
        let x = NSString.init(string:string).substring(with: (matchs[0].range))
        let y = NSString.init(string:string).substring(with: (matchs[1].range))
        return (try x.stringToInt(), try y.stringToInt())
    }
    
    private func getVerifiedPoints(points:[String]) -> [String]{
        let varifiedPoints = points.filter{
            return Answer.init($0).isCoordinateFormat()
        }
        return varifiedPoints
    }
    
}

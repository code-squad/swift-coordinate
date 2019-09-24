//
//  StringConverter.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


protocol PointModifiable {
    static func convertToPoint(str: String) throws -> MyPoint
}
protocol LineModifiable {
    static func convertToLine(str: String) throws -> MyLine
}

struct StringConverter: PointModifiable, LineModifiable {
    
    static func convertToPoint(str: String) throws -> MyPoint {
        let strWithoutOpenBrace = remove(str: str, keyword: "(")
        let strWithoutBrace = remove(str: strWithoutOpenBrace, keyword: ")")
        let xy = splitToArr(str: strWithoutBrace, key: ",")
        guard let xString = xy.first,
            let yString = xy.last else {
                throw CoordinateError.stringConvert
        }
        guard let x = Int(xString),
            let y = Int(yString) else {
                throw CoordinateError.stringConvert
        }
        return MyPoint(x: x, y: y)
    }
    
    static func convertToLine(str: String) throws -> MyLine {
        let strWithoutDash = splitToArr(str: str, key: "-")
        guard let pointAString: String = strWithoutDash.first,
            let pointBString: String = strWithoutDash.last else {
                throw CoordinateError.stringConvert
        }
        do {
            let pointA = try convertToPoint(str: pointAString)
            let pointB = try convertToPoint(str: pointBString)
            return MyLine(pointA: pointA, pointB: pointB)
        } catch {
            throw CoordinateError.stringConvert
        }
    }
    
    static func convertToTriangle(str: String) throws -> MyTriangle {
        let strWithoutDash = splitToArr(str: str, key: "-")
        let pointAString: String = strWithoutDash[0]
        let pointBString: String = strWithoutDash[1]
        let pointCString: String = strWithoutDash[2]
        do {
            let pointA = try convertToPoint(str: pointAString)
            let pointB = try convertToPoint(str: pointBString)
            let pointC = try convertToPoint(str: pointCString)
            return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        } catch {
            throw CoordinateError.stringConvert
        }
    }
    
    static func remove(str: String, keyword: Character) -> String {
        let subStrings = str.split(separator: keyword)
        return subStrings.joined()
    }
    
    static func splitToArr(str: String, key: Character) -> [String] {
        let subStrings = str.split(separator: key)
        return subStrings.map { String($0) }
    }
}

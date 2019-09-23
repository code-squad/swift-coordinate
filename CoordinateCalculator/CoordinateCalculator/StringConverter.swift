//
//  StringConverter.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


protocol PointModifiable {
    static func modify(str: String) -> MyPoint
}
struct StringConverter: PointModifiable {
    static func modify(str: String) -> MyPoint {
        let firstWithBrace: String = str.split(separator: ",").first.map { String($0) } ?? ""
        let lastWithBrace:String = str.split(separator: ",").last.map { String($0) } ?? ""
        let firstString = firstWithBrace.split(separator: "(").last.map { String($0) } ?? ""
        let secondString = lastWithBrace.split(separator: ")").first.map{ String($0) } ?? ""
        return MyPoint(x: Int(firstString) ?? 0, y: Int(secondString) ?? 0)
    }
}

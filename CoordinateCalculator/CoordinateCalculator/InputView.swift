//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func read() -> MyPoint? {
        print("좌표를 입력하세요.")
        guard let input = readLine() else { return nil }
        if !isValidCoordinateFormat(input) { return nil }
        let parsed = parse(input: input)
        guard let x = isContainOnlyDigit(parsed.x) else { return nil }
        guard let y = isContainOnlyDigit(parsed.y) else { return nil }
        return MyPoint(x: x, y: y)
    }
    
    static private func isValidCoordinateFormat(_ format: String) -> Bool {
        if format.first != "(" || format.last != "(" || !format.contains(",") {
            return false
        }
        return true
    }
    
    static private func parse(input:String) -> (x: String?, y: String?) { // only parsing
        var data = input
        // "(" , ")" 제거 - 앞뒤에 있다는 것이 증명이 되었으니
        data.remove(at: data.startIndex)
        data.remove(at: data.endIndex)
        let splited = data.split(separator: ",").map {String($0)}
        return splited.count == 2 ? (splited[0], splited[1]) : (nil, nil)
    }
    
    static private func isContainOnlyDigit(_ data: String?) -> String? {
        guard let data = data else { return nil }
        let withoutNegative = data.replacingOccurrences(of: "-", with: "") // if "-4" -> "4"
        let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: withoutNegative).isSubset(of: digitCharacterSet) ? data : nil
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func read()->MyPoint? {
        print("좌표를 입력하세요.")
        guard let input = readLine() else { return nil }
        let parsed = parse(input)
        if !isValidCoordinate(parsed) {
            print("올바르지 않은 값의 형식입니다.")
            return nil
        }
        return MyPoint(x: parsed[0], y: parsed[1])
    }
    
    static private func parse(_ input:String) -> [String]{ // only parsing
        var data = input
        data = data.replacingOccurrences(of: "(", with: "") // remove "("
        data = data.replacingOccurrences(of: ")", with: "") // remove ")"
        return data.split(separator: ",").map {String($0)} // split + [String]
    }
    
    static private func isValidCoordinate(_ coordinates: [String]) -> Bool { // check is valid coordinates
        return !coordinates.map(isContainDigit).contains(false)
    }
    
    static private func isContainDigit(_ data: String) -> Bool { // check is contain non-digit characters
        let withoutNegative = data.replacingOccurrences(of: "-", with: "") // if "-4" -> "4"
        let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: withoutNegative).isSubset(of: digitCharacterSet)
    }
}

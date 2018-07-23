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
        guard let validCoordinate = generateValidCoordinate(parse(input: input)) else {
            print("올바르지 않은 값의 형식입니다.")
            return nil
        }
        return MyPoint(x: validCoordinate.x, y: validCoordinate.y)
    }
    static private func parse(input:String) -> (x: String?, y: String?) { // only parsing
        var data = input
        data = data.replacingOccurrences(of: "(", with: "") // remove "("
        data = data.replacingOccurrences(of: ")", with: "") // remove ")"
        let splited = data.split(separator: ",").map {String($0)}
        return splited.count == 2 ? (splited[0], splited[1]) : (nil, nil)
    }
    
    static private func generateValidCoordinate(_ coordinates: (x: String?, y: String?)) -> (x: String, y:String)? { // check is valid coordinates
        guard let x = coordinates.x else { return nil }
        guard let y = coordinates.y else { return nil }
        return isContainOnlyDigit(x) && isContainOnlyDigit(y) ? (x,y) : nil
    }
    
    static private func isContainOnlyDigit(_ data: String) -> Bool { // check is contain non-digit characters
        let withoutNegative = data.replacingOccurrences(of: "-", with: "") // if "-4" -> "4"
        let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: withoutNegative).isSubset(of: digitCharacterSet)
    }
    
}

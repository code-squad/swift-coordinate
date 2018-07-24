//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    struct Validation {
        private let target: String
        
        init(target: String) {
            self.target = target
        }
        
        func makeValidPoint()-> MyPoint? {
            if !isValidCoordinateFormat() { return nil }
            let parsed = parse()
            guard let x = isContainOnlyDigit(parsed.x), let y = isContainOnlyDigit(parsed.y) else { return nil }
            return MyPoint(x: x, y: y)
        }
        
        private func isValidCoordinateFormat() -> Bool {
            if target.first != "(" || target.last != ")" || !target.contains(",") {
                print("올바르지 않은 입력 형식입니다.")
                return false
            }
            return true
        }
        
        private func parse() -> (x: String?, y: String?) { // only parsing
            var data = target
            data = data.replacingOccurrences(of: "(", with: "")
            data = data.replacingOccurrences(of: ")", with: "")
            let splited = data.split(separator: ",").map { String($0) }
            return splited.count == 2 ? (splited[0], splited[1]) : (nil, nil)
        }
        
        private func isContainOnlyDigit(_ element: String?) -> String? {
            guard let element = element else { return nil }
            let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
            if CharacterSet(charactersIn: element).isSubset(of: digitCharacterSet) {
                return element
            }
            print("숫자만 입력해주세요.")
            return nil
        }
    }
    
    static func read() -> MyPoint? {
        print("좌표를 입력하세요.")
        guard let input = readLine() else { return nil }
        guard let myPoint = Validation(target: input).makeValidPoint() else { return nil }
        return myPoint
    }
}

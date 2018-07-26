//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

typealias PointTuple = (x: Int, y: Int)

struct InputView {
    
    struct Validation {
        private let target: [String]
        
        init(target: String) {
            self.target = target.split(separator: "-").map {String($0)}
        }
        
        func makePoints()-> [PointTuple]? {
            if !isValidFormat() { return nil }
            let parsed = parse()
            if parsed.contains(where : {$0 == nil}) { return nil }
            return parsed.compactMap {$0}
        }
        
        private func isValidFormat() -> Bool {
            let validations = target.map(isValidPointFormat)
            return validations.contains(false) ? false : true
        }
        
        private func isValidPointFormat(_ rawValue: String) -> Bool { // (~,~) format
            return rawValue.first != "(" || rawValue.last != ")" || !rawValue.contains(",") ? false : true
        }
    
        private func parse() -> [PointTuple?] {
            return target.map(parsePoint)
        }
        
        private func parsePoint(from rawValue: String) -> PointTuple? {
            var chunk = rawValue
            chunk = chunk.replacingOccurrences(of: "(", with: "")
            chunk = chunk.replacingOccurrences(of: ")", with: "")
            let splited = chunk.split(separator: ",").map {String($0)}
            return makePointTuple(from: splited)
        }
        
        private func makePointTuple(from elements: [String]) -> PointTuple? {
            if elements.count != 2 { return nil }
            guard let x = Int(elements[0]) else { return nil }
            guard let y = Int(elements[1]) else { return nil }
            if x > 24 || y > 24 || x < 0 || y < 0 { return nil }
            return (x,y)
        }
    }
    
    static func read() -> [PointTuple]? {
        print("좌표를 입력하세요.")
        guard let input = readLine() else { return nil }
        guard let points = Validation(target: input).makePoints() else { return nil }
        return points
    }
}

//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// ConvertInput 구조체의 역할 : 입력 형태가 올바른지 확인하고, 올바른 경우 정수형 좌표로 변환
struct ConvertInput {
    private let input: String
    
    // 에러처리를 거친 입력이므로 correctInput으로 변수네이밍
    init(correctInput: String) {
        self.input = correctInput
    }
    
    // 초기 입력을 '-'을 기준으로 분리해주는 메소드
    // "(10,10)-(10,10)" -> ["(10,10)", "(10,10)"]
    private func separate(_ input: String) -> [String] {
        return input.split(separator: "-").map {String($0)}
    }
    
    // 분리된 초기 입력 배열의 요소를 다시 ','을 기준으로 분리해주는 메소드
    // "(10,10)" -> ["10","10"]
    private func transform(_ point: String) -> [String] {
        return point.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {String($0)}
    }
    
    // 분리된 배열의 요소들로 이중배열을 만들어주는 메소드
    // ["(10,10)", "(10,10)"] -> [["10","10"], ["10","10"]]
    private func makeRawPoints(_ separatedInput: [String]) -> [[String]] {
        var rawPoints: [[String]] = []
        
        separatedInput.forEach {
            rawPoints.append(transform($0))
        }
        return rawPoints
    }
    
    // 배열의 요소들을 MyPoint에 구조체에 넣어 좌표를 리턴하는 메소드
    // ["10", "10"] -> MyPoint(x: 10, y: 10)
    private func makePoint(_ points: [String]) -> MyPoint {
        return MyPoint(x: Int(points[0]) ?? -1, y: Int(points[1]) ?? -1)
    }
    
    // 초기 입력값을 튜플로 좌표쌍으로 리턴하는 메소드
    // "(10,10)-(10,10)" -> (MyPoint(x: 10, y: 10),MyPoint(x: 10, y: 10))
    private func makePointSet(_ input: String) -> (MyPoint, MyPoint) {
        let pairs = separate(input)             // "(10,10)-(10,10)"      -> ["(10,10)", "(10,10)"]
        let rawPoints = makeRawPoints(pairs)    // ["(10,10)", "(10,10)"] -> [["10","10"], ["10","10"]]
        var points: [MyPoint] = []
        
        rawPoints.forEach {
            points.append(makePoint($0))        // ["10", "10"]           -> MyPoint(x: 10, y: 10)
        }
        
        return (points[0], points[1])
    }
    
    // 만들어진 좌표쌍(튜플)을 전달해주는 메소드
    public func delievePoints() -> (MyPoint, MyPoint) {
        return makePointSet(self.input)
    }
}

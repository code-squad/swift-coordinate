//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static private let guideMessage = "좌표를 입력하세요."
    
    static func readInput() -> String {
        print(self.guideMessage)
        guard let input:String = readLine() else { return String() }
        return input
    }
    
    static func separateCoordinate(input:String, separator:Character) -> (x:String, y:String) {
        let inputBracketsRemoved = String(input.dropFirst().dropLast())
        let xy = inputBracketsRemoved.split(separator:separator).map({String($0)})
        let x = xy[0], y = xy[1] // 개선 가능한지 인덱스
        return (x,y)
    }
    
}

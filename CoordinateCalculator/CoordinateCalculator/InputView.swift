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
    static private let comma : Character = ","
    
    static func readInput() -> String {
        print(self.guideMessage)
        guard let input:String = readLine() else { return String() }
        return input
    }
    
    static func separateCoordinate(input:String) -> [String] {
        let inputBracketsRemoved = String(input.dropFirst().dropLast())
        return inputBracketsRemoved.split(separator:comma).map({String($0)})
    }
    
    static func getCoordinate(input:String) -> (x:String, y:String) {
        let xy = separateCoordinate(input:input)
        return (xy[0],xy[1])
    }
    
}

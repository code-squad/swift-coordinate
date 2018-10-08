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
    
    static func separateCoordinate(input:String, separator:Character) -> [String] {
        let inputBracketsRemoved = String(input.dropFirst().dropLast())
        return inputBracketsRemoved.split(separator:separator).map({String($0)})
    }
    
    static func getCoordinate(input:String, separator:Character) -> (x:String, y:String) {
        let xy = separateCoordinate(input:input, separator:separator)
        return (xy[0],xy[1])
    }
    
    static func makeMyPoint(input:String) -> MyPoint {
        let coordinate = InputView.getCoordinate(input:input, separator:",")
        guard let x = Int(coordinate.x) else { return MyPoint() }
        guard let y = Int(coordinate.y) else { return MyPoint() }
        return MyPoint(x:x,y:y)
    }
    
}

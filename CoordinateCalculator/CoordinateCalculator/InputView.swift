//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    // 사용자의 입력을 받음
    func readInput(message: String) -> String {
        print(message)
        guard let input = readLine() else {
            return "Error"
        }
        return input
    }
    
    // X,Y 좌표로 나누어 줌
    func splitXandYlocation(location: String) -> MyPoint{
        var splitUserInput : [String] = location.components(separatedBy: [",", ")", "("])
        return MyPoint(xPosition: Int(splitUserInput[1]) ?? -1, yPosition: Int(splitUserInput[2]) ?? -1)
    }
}

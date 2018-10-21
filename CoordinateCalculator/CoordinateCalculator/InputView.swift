//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // X,Y 좌표로 나누어 줌
    func splitXandYlocation() -> (Int?, Int?){
        var splitUserInput : [String] = readInput(message: "좌표를 입력해주세요").components(separatedBy: [",", ")", "("])
        return (Int(splitUserInput[1]), Int(splitUserInput[2]))
    }
    
    // 사용자의 입력을 받음
    private func readInput(message: String) -> String {
        print(message)
        guard let input = readLine() else { return "" }
        return input
    }
}

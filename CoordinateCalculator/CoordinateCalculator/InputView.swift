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
    func splitXandYlocation(input: String) -> (String, String){
        var splitUserInput : [String] = input.components(separatedBy: [",", ")", "("])
        return (splitUserInput[1], splitUserInput[2])
    }
    
    // 사용자의 입력을 받음
    func readInput(message: String) -> String {
        print(message)
        guard let input = readLine() else { return "" }
        return input
    }
}

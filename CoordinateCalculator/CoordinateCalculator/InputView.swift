//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static private func readInput(ment:String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static func readCoordinate(_ isRepeat:Bool) -> String {
        let typingMent = "좌표를 입력하세요. //단, 숫자의 최대 크기는 24"
        let retypeMent = "입력값을 확인하시고 다시 입력 해주세요."
        let input = (isRepeat == true) ? readInput(ment: retypeMent) : readInput(ment: typingMent)
        return input
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    /// 입력을 받는 함수
    func readInput() -> String?{
        print("좌표를 입력하세요 (두 숫자는 ,로 구분해주고, 좌표 간에는 -로 구분해주세요)")
        let inputLocation = readLine()
        return inputLocation
    }
    /// 입력에 포함되지 않는 문자가 있는지 판단하는 함수
    func distinctContain(inputLocation : String?) -> String?{
        let notContainedInput = CharacterSet(charactersIn: "0123456789,()-").inverted
        if ((inputLocation?.rangeOfCharacter(from: notContainedInput)) == nil){ return inputLocation }
        else { return nil }
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    func readInput() -> String?{
        while true {
            print("두좌표를 입력하세요 (두 숫자는 ,로 구분해주고, 두 좌표 간에는 -로 구분해주세요)")
            let inputLocation = readLine()
            let charactersInput = CharacterSet(charactersIn: "0123456789,()-").inverted
            if ((inputLocation?.rangeOfCharacter(from: charactersInput)) == nil){
                return inputLocation
                break
            }
        }
    }
}

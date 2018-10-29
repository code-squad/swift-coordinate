//
//  ErrorState.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputState : String {
    case outOfRangeCharacter = "캐릭터 셋에 있는 문자를 입력하세요."   // 캐릭터 셋에 없은 입력이 들어온 경우
    case notSupportRange = "지원되지 않는 도형입니다."               // 지원되지 않는 도형을 입력한 경우
    case wrongOrder = "(숫자,숫자) 형태로 입력하세요."               // 순서에 맞지 않는 입력을 한 경우
    case overFlowNumber = "범위에 맞는 숫자를 입력하세요."            // 범위를 벗어나느 숫자를 입력한 경우
    case notEstablishRect = "사각형이 성립하지 않습니다."
    case rightInput = ""                                      // 올바른 입력을 했을 경우
}

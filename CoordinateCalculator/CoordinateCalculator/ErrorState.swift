//
//  ErrorState.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorState {
    case outOfRangeCharacter   // 캐릭터 셋에 없은 입력이 들어온 경우
    case wrongOrder            // 순서에 맞지 않는 입력을 한 경우
    case overFlowNumber        // 범위를 벗어나느 숫자를 입력한 경우
    case rightInput            // 올바른 입력을 했을 경우
}

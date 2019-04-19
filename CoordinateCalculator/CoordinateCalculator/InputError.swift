//
//  InputError.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: String, Error {
    case NonInputStandard = "소괄호로 둘러싸인 x,y 좌표를 정확히 입력해주세요. ex: (4,16)"
    case NonCoordinateStandard = "x,y 좌표는 0부터 24까지 입력해주세요."
}

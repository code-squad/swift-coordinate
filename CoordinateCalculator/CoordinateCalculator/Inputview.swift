//
//  Inputview.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation
struct InputView {
    
    static func readInput() -> String? {
        ask(.requestCoordinate)
        return readLine()
    }
    
    private static func ask(_ massage:RequestMassage) {
        print(massage.rawValue)
    }
    
    
}

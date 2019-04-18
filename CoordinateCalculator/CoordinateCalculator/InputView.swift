//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private(set) var valueEntered: String = ""
    
    private mutating func readInput () {
        print("좌표를 입력하세요.")
        valueEntered = readLine() ?? "0"
    }
    
    mutating func inputLoop (_ mypoint: MyPoint) -> MyPoint {
        var point = mypoint
        while true {
            readInput()
            do {
                try point.inputToCoordinate(self)
                break
            }
            catch InputError.inputNonStandard {
                print("소괄호로 둘러싸인 x,y 좌표를 정확히 입력해주세요. ex: (4,16)")
            }
            catch InputError.coordinateNonStandard {
                print("x,y 좌표는 0부터 24까지 입력해주세요.")
            }
            catch {
                print("입력값을 확인해주세요.")
            }
        }
        
        return point
    }
}

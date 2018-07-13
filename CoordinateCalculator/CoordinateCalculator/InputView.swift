//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 1100200/Users/1100200/Desktop/iOS101/project/swift-coordinate/CoordinateCalculator/CoordinateCalculator/InputView.swift on 2018. 7. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // * Step 2: 좌표 입력과 출력
    func readInput () -> String {
        print ("좌표를 입력해 주세요 예) (12,23)")
        if let coordinates = readLine() {
            guard coordinates.contains("q") else { return coordinates }
        }
        return "q"
    }
    //    static func readInput() -> String? {
    //        let a = readLine()
    //        if let b = a {
    //            print(b)
    //        }
    //        return a
    //    }

}

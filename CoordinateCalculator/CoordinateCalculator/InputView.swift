//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {

    private static func readSomethingData(_ announcement : String) -> String {
        print(announcement)
        let some = readLine() ?? ""
        return some
    }
    
    func inputCoordinates() -> String {
        let input = InputView.readSomethingData("좌표를 입력하세요. (x, y) 또는 (x,y)-(x,y)")
        
        return input
    }
}

//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

public struct OutputView {
    static func drawAxis(){
        // 출력 화면을 지우는 ANSI코드
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.cursor.move(row:10, col: 10))*")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    
    
    }
}

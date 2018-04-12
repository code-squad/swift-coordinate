//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
///프린트용 구조체
struct OutputView{
    /// 좌표축을 프린트
    func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.cyan)\(ANSICode.axis.draw())")
    }
}


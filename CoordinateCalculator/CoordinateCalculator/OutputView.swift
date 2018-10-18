//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func drawAxis() {
        print("\(ANSICode.text.black)\(ANSICode.axis.draw())")
    }
    
    func clearBackground() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

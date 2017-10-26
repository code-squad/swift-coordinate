//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 25..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    static let axisErrorMessage = "좌표가 24를 넘지 않도록 입력해주세요."
    
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())")
    }
    
    static func printHeart(at userPoint: MyPoint){
        
    }
}

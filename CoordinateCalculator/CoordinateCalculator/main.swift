//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){

    /// 프린트용 구조체 선언
    let outputView = OutputView()
    outputView.drawAxis()
    /// 인풋뷰 구조체 선언
    let cutter = Cutter()
    /// 유저인풋을 받음
    guard let pp = cutter.cutRangeFrom() else {
        return 
    }
}

main()



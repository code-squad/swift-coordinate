//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
struct OutputView {
    static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.cyanBright)\(ANSICode.axis.draw())")
    }
}

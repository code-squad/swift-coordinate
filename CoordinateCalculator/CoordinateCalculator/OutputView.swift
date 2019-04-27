//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    
    let target:Drawable
    
    init(_ target:Drawable) {
        self.target = target
    }
    func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.cyanBright)\(ANSICode.axis.draw())")
    }
    func output(){
        self.target.draw()
    }
    
}

//
//  File.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


protocol ConvertableDouble{
    func changeToDouble()->(Double)
}
extension ConvertableDouble{
    func changeToDouble()->(Double){
        return Double.init(self)
    }
}
// - MARK: - Int 구조체의 확장
extension Int:ConvertableDouble{
   
    func isEven()->(Bool){
        return self % 2 == 0  ? true:false
    }
}

// - MARK: - Float 구조체의 확장
extension Float:ConvertableDouble{
    func changeToDouble() -> (Double) {
        return Double.init(self)
    }
}

//
//  Point.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape{
    var points:[MyPoint] { get }
}

//calculateResult()를 내부에서 호출하기만 할꺼면 프로토콜에 넣지 않고 내부에 private으로 구현!
protocol Resultable {
    func result() -> String
}

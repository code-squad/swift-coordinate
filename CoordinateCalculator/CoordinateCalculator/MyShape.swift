//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 12. 1..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    // 기존 타입조건을 프로토콜에 줘서 분류하던것을 함수로 변경
    func makeCoordinates () -> [MyPoint]
}

protocol ShapeCalculation {
    func calculate () -> Double
     var resultDescription: String { get }
}

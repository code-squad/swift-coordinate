//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// line과 point를 타입으로 갖는 프로토콜 선언
protocol MyShape {
    var type: SyntaxChecker.Shape { get set }
}

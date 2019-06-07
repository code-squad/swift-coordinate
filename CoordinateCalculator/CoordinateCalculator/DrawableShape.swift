//
//  Drawable.swift
//  CoordinateCalculator
//
//  Created by JH on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol DrawableShape {    
    var drawablePoints: [MyPoint] { get }
}

protocol SimplyDescribable {
    /// 간단한 설명을 반환합니다.
    var simpleDescription: String { get }
}

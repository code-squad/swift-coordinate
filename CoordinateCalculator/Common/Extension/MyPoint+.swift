//
//  MyPoint+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

// point 프로토콜을 준수
extension MyPoint: PointProtocol {
    func getPoints() -> [MyPoint] {
        return [self]
    }
}

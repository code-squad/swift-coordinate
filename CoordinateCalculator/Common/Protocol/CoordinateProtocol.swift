//
//  File.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

protocol PointProtocol {
    func getPoints() -> [MyPoint]
}

// SOLID 원칙 중 인터페이스 분리 작업으로 MyPoint는 직선의거리를 구현 할 필요가 없어서 분리
protocol LineProtocol: PointProtocol{
    func getDistance() -> Double
}

//
//  File.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
protocol PointProtocol {
    func getPoint() -> [MyPoint]
}

protocol LineProtocol: PointProtocol {
    func getDistance() -> Double
}

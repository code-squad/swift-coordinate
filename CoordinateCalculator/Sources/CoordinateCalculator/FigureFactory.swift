//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 2..
//

import Foundation

struct FigureFactory {
    
    // MyPoint 구조체 관련 에러 및 에러메시지 종류.
    enum CoordsError: String, Error, Equatable {
        case isNil = "입력값이 없습니다."                              // nil 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."         // 좌표계 최대범위 초과 에러.
        case invalidInputPattern = "형식을 맞춰주세요. 예: (숫자,숫자)-"  // 입력 패턴 에러.
        case invalidRectPoints = "직사각형 좌표를 입력해주세요."          // 직사각형 외 에러.
        case zeroException = "서로 다른 세 점을 입력해주세요."            // 삼각형 넓이 구할 시 분모 0 에러.
    }
    
    // 각 도형들의 꼭지점 갯수
    enum Figures: Int{
        case point = 1
        case line = 2
        case triangle = 3
        case rect = 4
    }
    
    // 꼭지점 갯수에 따라 각 도형 구조체 생성하여 반환.
    static func createFigure(from points: [MyPoint]) throws -> FigureCalculatable {
        switch points.count {
        case Figures.point.rawValue: return MyPoint(from: points)
        case Figures.line.rawValue: return MyLine(from: points)
        case Figures.triangle.rawValue: return MyTriangle(from: points)
        case Figures.rect.rawValue: return try MyRect(from: points)
        default: return MyPoint(from: points)
        }
    }
    
}

extension FigureFactory {
    
    // 점의 x좌표, y좌표를 각각 세트에 넣어 반환.
    static func getCoordSets(in points: [MyPoint]) -> (Set<Int>, Set<Int>) {
        var xSet = Set<Int>()
        var ySet = Set<Int>()
        // 모든 점들을 x세트, y세트로 나눠 모음.
        for point in points{
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return (xSet, ySet)
    }
    
}

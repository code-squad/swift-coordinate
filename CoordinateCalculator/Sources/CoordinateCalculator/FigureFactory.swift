//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 2..
//

import Foundation

struct FigureFactory {
    var userFigure: FigureCalculatable
    
    init() {
        self.userFigure = MyPoint()
    }
    
    init(with userData: UserData) throws {
        self.userFigure = try FigureFactory.produceFigure(from: userData)
    }
    
    // 각 도형들의 꼭지점 갯수
    enum Figures: Int {
        case point = 1
        case line = 2
        case triangle = 3
        case rect = 4
    }
    
    // 에러 메시지 종류.
    enum CoordsError: String, Error {
        case isNil = "입력값이 없습니다."                              // nil 에러.
        case invalidInputPattern = "형식을 맞춰주세요. 예: (숫자,숫자)-"  // 입력 패턴 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."         // 좌표계 최대범위 초과 에러.
        case invalidRectPoints = "직사각형 좌표를 입력해주세요."          // 직사각형 외 에러.
        case zeroException = "서로 다른 세 점을 입력해주세요."            // 삼각형 넓이 구할 시 분모 0 에러.
    }
    
    // 꼭지점 갯수에 따라 각 도형 구조체 생성하여 반환.
    static func produceFigure(from userData: UserData) throws -> FigureCalculatable {
        let points = userData.userPoints
        try checkErrors(from: points)
        switch points.count {
        case Figures.point.rawValue: return MyPoint(from: points)
        case Figures.line.rawValue: return MyLine(from: points)
        case Figures.triangle.rawValue: return MyTriangle(from: points)
        case Figures.rect.rawValue: return try MyRect(from: points)
        default: return MyPoint(from: points)
        }
    }
    
    private static func checkErrors(from points: [MyPoint]) throws {
        // 좌표축 최대범위를 넘으면 에러처리.
        guard isUnderAxisLimit(points) else { throw FigureFactory.CoordsError.outOfBounds }
        // 삼각형 입력 시 같은 포인트가 있으면 에러처리.
        if points.count == FigureFactory.Figures.triangle.rawValue && MyTriangle.containsSameCoords(points) {
            throw FigureFactory.CoordsError.zeroException
        }
        // 사각형 입력 시 직사각형 형태가 아니면 에러처리.
        guard points.count == FigureFactory.Figures.rect.rawValue && MyRect.isRectangle(by: points) else { throw FigureFactory.CoordsError.invalidRectPoints }
    }
    
    // 좌표축 최대값 넘는지 여부 반환.
    static func isUnderAxisLimit(_ points: [MyPoint]) -> Bool {
        for point in points {
            // 한 좌표라도 범위를 넘으면 false 반환.
            guard point.x <= ANSICode.axis.AxisLimit && point.y <= ANSICode.axis.AxisLimit else { return false }
        }
        // 모든 좌표가 범위 내에 있으면 true 반환.
        return true
    }
    
}

extension FigureFactory {
    
    // 점의 x좌표, y좌표를 각각 세트에 넣어 반환.
    static func getCoordSets(in points: [MyPoint]) -> (Set<Int>, Set<Int>) {
        var xSet = Set<Int>()
        var ySet = Set<Int>()
        // 모든 점들을 x세트, y세트로 나눠 모음.
        for point in points {
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return (xSet, ySet)
    }
    
}

extension String {
    
    // 문자열에서 매칭되는 패턴을 찾아 반환.
    func split(pattern: String) -> [String] {
        do {
            // 파라미터로 받은 패턴으로 RegExp 객체 생성.
            let regex = try NSRegularExpression(pattern: pattern)
            // 현재 문자열(self)에서 패턴에 매칭되는 결과 반환. (NSTextCheckingResult 배열타입)
            let nsTextResults = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            let results = nsTextResults.map {
                // NSTextCheckingResult 타입에는 패턴이 매칭되는 문자열 범위 등의 정보가 들어있음.
                // 현재 문자열(self)에서 해당 범위 만큼(Substring)을 String으로 반환.
                return String(self[Range($0.range, in: self)!])
            }
            return results
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
    
}

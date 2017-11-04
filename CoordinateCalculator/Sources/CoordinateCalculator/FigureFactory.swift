//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 2..
//

import Foundation

struct FigureFactory {
    
    private(set) var product: FigureCalculatable
    
    init(_ inputView: InputView) throws {
        self.product = try FigureFactory.produceFigure(from: inputView.userInput)
    }
    
    private static func produceFigure(from userInput: String) throws -> FigureCalculatable {
        let stringsInCoordPattern: [String] = try FigureFactory.makeIntoCoordPattern(from: userInput)
        // 좌표패턴의 문자열에서 MyPoint 생성. (좌표범위 넘으면 에러처리도 함)
        let points: [MyPoint] = try FigureFactory.generatePoints(from: stringsInCoordPattern)
        // MyPoint 갯수에 따라 각 도형 생성하여 반환.
        return try FigureFactory.produceFigure(from: points)
    }
    
    // 각 도형들의 꼭지점 갯수
    enum Figures: Int{
        case point = 1
        case line = 2
        case triangle = 3
        case rect = 4
    }
    
    // 꼭지점 갯수에 따라 각 도형 구조체 생성하여 반환.
    static func produceFigure(from points: [MyPoint]) throws -> FigureCalculatable {
        switch points.count {
        case Figures.point.rawValue: return MyPoint(from: points)
        case Figures.line.rawValue: return MyLine(from: points)
        case Figures.triangle.rawValue: return MyTriangle(from: points)
        case Figures.rect.rawValue: return try MyRect(from: points)
        default: return MyPoint(from: points)
        }
    }
    
    // 에러 메시지 종류.
    enum CoordsError: String, Error {
        case isNil = "입력값이 없습니다."                              // nil 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."         // 좌표계 최대범위 초과 에러.
        case invalidInputPattern = "형식을 맞춰주세요. 예: (숫자,숫자)-"  // 입력 패턴 에러.
        case invalidRectPoints = "직사각형 좌표를 입력해주세요."          // 직사각형 외 에러.
        case zeroException = "서로 다른 세 점을 입력해주세요."            // 삼각형 넓이 구할 시 분모 0 에러.
    }
    
    // 입력 가능한 문자열 패턴. ex. (3,5)- 형식 가능.
    private static let validInputPattern: String = "\\([0-9]+,[0-9]+\\)-?"
    
    // 문자열을 좌표패턴 기준으로 나누어 문자열 배열로 반환.
    private static func makeIntoCoordPattern(from inputLine: String) throws -> [String] {
        // 문자열을 좌표 패턴으로 자름.
        let stringsInCoordPattern = inputLine.split(pattern: FigureFactory.validInputPattern)
        // 입력 패턴이 유효하지 않으면 에러처리.
        guard stringsInCoordPattern.count > 0 else { throw FigureFactory.CoordsError.invalidInputPattern }
        return stringsInCoordPattern
    }
    
    // 좌표패턴의 문자열들에서 숫자만 추출하여 MyPoint 객체들 생성.
    private static func generatePoints(from stringsInCoordPattern: [String]) throws -> [MyPoint] {
        var resultPoints: [MyPoint] = []
        for stringLikeCoord in stringsInCoordPattern{
            // 숫자패턴인 문자열만 추출.
            let coordsInString = stringLikeCoord.split(pattern: "[0-9]+")
            // 문자열을 숫자타입으로 변환.
            let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
            // 숫자타입을 MyPoint타입으로 변환.
            resultPoints.append(MyPoint(x: Int(coords[0]), y: Int(coords[1])))
        }
        // 좌표축 최대범위를 넘으면 에러처리.
        guard isUnderAxisLimit(resultPoints) else{ throw FigureFactory.CoordsError.outOfBounds }
        // 삼각형 입력 시 같은 포인트가 있으면 에러처리.
        if resultPoints.count == FigureFactory.Figures.triangle.rawValue && MyTriangle.containsSameCoords(resultPoints){
            throw FigureFactory.CoordsError.zeroException
        }
        return resultPoints
    }
    
    // 좌표축 최대값 넘는지 여부 반환.
    private static func isUnderAxisLimit(_ points: [MyPoint]) -> Bool {
        for point in points{
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
        for point in points{
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return (xSet, ySet)
    }
    
}

extension String{
    
    // 문자열에서 매칭되는 패턴을 찾아 반환.
    func split(pattern: String) -> [String] {
        do {
            // 파라미터로 받은 패턴으로 RegExp 객체 생성.
            let regex = try NSRegularExpression(pattern: pattern)
            // 현재 문자열(self)에서 패턴에 매칭되는 결과 반환. (NSTextCheckingResult 배열타입)
            let nsTextResults = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            let results = nsTextResults.map({
                // NSTextCheckingResult 타입에는 패턴이 매칭되는 문자열 범위 등의 정보가 들어있음.
                // 현재 문자열(self)에서 해당 범위 만큼(Substring)을 String으로 반환.
                return String(self[Range($0.range, in: self)!])
            })
            return results
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
    
}

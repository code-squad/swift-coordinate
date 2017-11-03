//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    // 입력 가능한 문자열 패턴. ex. (3,5)- 형식 가능.
    static let validInputPattern: String = "\\([0-9]+,[0-9]+\\)-?"
    
    // 사용자 입력값을 MyPoint 객체로 변환.
    static func readInput(rawCoords: String) throws -> FigureCalculatable{
        // 문자열을 좌표 패턴으로 자름.
        let stringsInCoordPattern = rawCoords.split(pattern: InputView.validInputPattern)
        // 입력 패턴이 유효하지 않으면 에러처리.
        guard stringsInCoordPattern.count > 0 else { throw OutputView.CoordsError.invalidInputPattern }
        // 좌표패턴의 문자열에서 MyPoint 생성. (좌표범위 넘으면 에러처리도 함)
        let points = try generatePoints(from: stringsInCoordPattern)
        // MyPoint 갯수에 따라 각 도형 생성하여 반환.
        return try FigureFactory.createFigure(from: points)
    }
    
    // 좌표패턴의 문자열들에서 숫자만 추출하여 MyPoint 객체들 생성.
    private static func generatePoints(from stringsInCoordPattern: [String]) throws -> [MyPoint]{
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
        guard isUnderAxisLimit(resultPoints) else{ throw OutputView.CoordsError.outOfBounds }
        // 삼각형 입력 시 같은 포인트가 있으면 에러처리.
        if resultPoints.count == FigureFactory.Figures.triangle.rawValue && MyTriangle.containsSameCoords(resultPoints){
            throw OutputView.CoordsError.zeroException
        }
        return resultPoints
    }
    
    // 좌표축 최대값 넘는지 여부 반환.
    private static func isUnderAxisLimit(_ points: [MyPoint]) -> Bool{
        for point in points{
            // 한 좌표라도 범위를 넘으면 false 반환.
            guard point.x <= ANSICode.axis.AxisLimit && point.y <= ANSICode.axis.AxisLimit else { return false }
        }
        // 모든 좌표가 범위 내에 있으면 true 반환.
        return true
    }
}


extension String{
    // 문자열에서 매칭되는 패턴을 찾아 반환.
    func split(pattern: String) -> [String]{
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

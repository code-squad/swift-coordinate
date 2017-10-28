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
    
    // MyPoint 구조체 관련 에러 및 에러메시지 종류.
    enum CoordsError: String, Error{
        case isNil = "입력값이 없습니다."                           // nil 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."      // 좌표계 최대범위 초과 에러.
        case invalidInputPattern = "(Int, Int) 또는 (Int, Int)-(Int, Int)-.. 형식을 맞춰주세요."  // 입력 패턴 에러.
    }
    
    // 사용자 입력값을 MyPoint 객체로 변환.
    static func readInput(rawCoords: String) throws -> [MyPoint]{
        let stringsInCoordPattern = rawCoords.split(pattern: InputView.validInputPattern)
        // 입력 패턴이 유효하지 않으면 에러처리.
        guard stringsInCoordPattern.count > 0 else { throw InputView.CoordsError.invalidInputPattern }
        
        let points = generatePoints(from: stringsInCoordPattern)
        
        // 좌표축 최대범위를 넘으면 에러처리. (에러 출력은 메인에서. 출력함수는 OutputView에 구현.)
        guard isUnderAxisLimit(points) else{ throw InputView.CoordsError.outOfBounds }
        // 문자열로 얻은 x,y 값으로 MyPoint 객체 생성.
        return points
    }
    
    private static func generatePoints(from stringsInCoordPattern: [String]) -> [MyPoint]{
        var resultPoints: [MyPoint] = []
        // 숫자패턴인 문자열만 추출.
        for stringLikeCoord in stringsInCoordPattern{
            let coordsInString = stringLikeCoord.split(pattern: "[0-9]+")
            // 문자열을 숫자타입으로 변환.
            let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
            // 숫자타입을 MyPoint타입으로 변환.
            resultPoints.append(MyPoint(x: Int(coords[0]), y: Int(coords[1])))
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

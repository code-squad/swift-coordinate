//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    // 문자열을 MyPoint 객체로 변환.
    static func readInput(rawCoords: String) throws -> MyPoint{
        let coordsInString = rawCoords.split(pattern: "[0-9]+")
        // Int로 변환.
        let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
        // MyPoint로 변환.
        let point: MyPoint = MyPoint(x: Int(coords[0]), y: Int(coords[1]))
        // 좌표축 범위를 넘으면 에러처리.
        guard isUnderAxisLimit(point) else{ throw MyPoint.PointError.outOfBounds }
        // 문자열로 얻은 x,y 값으로 MyPoint 객체 생성.
        return point
    }
    
    // 좌표축 최대값 넘는지 여부 반환.
    private static func isUnderAxisLimit(_ point: MyPoint) -> Bool{
        // ANSICode.axis.AxisLimit 내에 있으면 true 반환.
        guard point.x > ANSICode.axis.AxisLimit || point.y > ANSICode.axis.AxisLimit else { return true }
        return false
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

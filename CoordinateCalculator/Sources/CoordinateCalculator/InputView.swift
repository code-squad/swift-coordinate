//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    // 사용자 입력값을 MyPoint 객체로 변환.
    static func readInput(rawCoords: String) throws -> MyPoint{
        // 숫자패턴인 문자열만 추출.
        let coordsInString = rawCoords.split(pattern: "[0-9]+")
        // 문자열을 숫자타입으로 변환.
        let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
        // 숫자타입을 MyPoint타입으로 변환.
        let point: MyPoint = MyPoint(x: Int(coords[0]), y: Int(coords[1]))
        // 좌표축 최대범위를 넘으면 에러처리. (에러 출력은 메인에서. 출력함수는 OutputView에 구현.)
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
    func isValid(observing characters: String) -> Bool{
        let characterSet = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: characters))
        let range = self.rangeOfCharacter(from: characterSet, options: .regularExpression)
        
        return false
    }
    
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

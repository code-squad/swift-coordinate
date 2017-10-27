//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    // 문장을 입력받아 전처리.
    static func askFor(message: String)->String?{
        print(message, terminator: " ")
        guard let inputLine = readLine() else{ return nil }
        return inputLine
    }
    
    static func readInput(rawCoords: String)->MyPoint{
        let coordsInString = rawCoords.split(pattern: "[0-9]+")
        // Int로 변환
        let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
        // 문자열로 얻은 x,y 값으로 MyPoint 객체 생성
        return MyPoint(x: Int(coords[0]), y: Int(coords[1]))
    }
    
    static func isOverAxisLimit(_ point: MyPoint)->Bool{
        var isUnderAxisLimit: Bool = false
        // ANSICode.axis.AxisLimit 을 넘으면 true 반환. 넘지 않으면 false 반환.
        if point.x > ANSICode.axis.AxisLimit || point.y > ANSICode.axis.AxisLimit {
            isUnderAxisLimit = true
        }
        return isUnderAxisLimit
    }
}


// 문자열에서 매칭되는 패턴을 찾아 반환.
extension String{
    func split(pattern: String)->[String]{
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let nsTextResults = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            let results = nsTextResults.map({
                return String(self[Range($0.range, in: self)!])
            })
            return results
        } catch let error {
            print("Invalid RegExp: ", error.localizedDescription)
            return []
        }
    }
}

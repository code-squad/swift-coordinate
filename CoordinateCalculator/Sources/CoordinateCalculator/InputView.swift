//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    // 문장을 입력받아 전처리.
    static func input(message: String)->String?{
        print(message, terminator: " ")
        guard let inputLine = readLine() else{ return nil }
        return inputLine
    }
    
    static func readInput(rawCoords: String)->MyPoint{
        // 괄호 제거.
        let coordsWithoutParenthesis: String = rawCoords.filter{ $0 != "(" || $0 != ")" }
        let coords: [Int] = coordsWithoutParenthesis.split(separator: ",").map{
            // ','로 나눈 문자들에 남아있는 공백을 제거한 후, Int로 변환.
            if let trimmedCoord = Int($0.trimmingCharacters(in: .whitespaces)){ return trimmedCoord }
            else{ return 0 }
        }
        // 문자열로 얻은 x,y 값으로 MyPoint 객체 생성
        return MyPoint(x: coords[0], y: coords[1])
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

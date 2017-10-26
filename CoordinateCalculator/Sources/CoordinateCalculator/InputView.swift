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
        var userPoint = MyPoint()
        // 좌표 정보는 괄호"(", ")"로 둘러쌓여 있으며 쉼표(,)로 x값과 y값을 구분한다. 문자열 분리한다.
        var coordsWithBracelet = rawCoords.split(separator: ",")
        print(rawCoords)
        print(coordsWithBracelet)
        // 문자열로 얻은 x,y 값으로 MyPoint 객체 생성
        return userPoint
    }
    
    static func isOverAxisLimit(_ point: MyPoint)->Bool{
        var isUnderAxisLimit: Bool = false
        // ANSICode.axis.AxisLimit 을 넘으면 true 반환. 넘지 않으면 false 반환.
        return isUnderAxisLimit
    }
}

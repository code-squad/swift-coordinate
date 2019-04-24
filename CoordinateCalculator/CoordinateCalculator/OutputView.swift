//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    /// 좌표를 그리는 함수
    func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
    }
    /// 세개의 좌표가 입력되었을때 MyTriangle 구조체의 변수들을 토대로 점을 찍는 함수
    func printMyTriangle(myTriangle : MyTriangle){
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myTriangle.lineAB.startPoint.y, col: (myTriangle.lineAB.startPoint.x*2)+2))*")
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myTriangle.lineAB.endPoint.y, col: (myTriangle.lineAB.endPoint.x*2)+2))*")
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myTriangle.lineAC.endPoint.y, col: (myTriangle.lineAC.endPoint.x*2)+2))*")
        print("\(ANSICode.cursor.move(row: 27, col: 25))")
        print("세 점사이의 삼각형 넓이는 \(myTriangle.areaCalculator(lineAB: myTriangle.lineAB, lineBC: myTriangle.lineBC, lineAC: myTriangle.lineAC))")
    }
    /// 두개의 좌표가 입력되었을때 MyLine 구조체의 변수들을 토대로 점을 찍는 함수
    func printMyLine(myLine : MyLine){
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myLine.startPoint.y, col: (myLine.startPoint.x*2)+2))*")
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myLine.endPoint.y, col: (myLine.endPoint.x*2)+2))*")
        print("\(ANSICode.cursor.move(row: 27, col: 25))")
        print("두 점사이의 거리는 \(myLine.lengthCalculator(startPoint: myLine.startPoint, endPoint: myLine.endPoint))")
    }
    /// 한개의 좌표가 입력되었을때 MyPoint 구조체의 변수들을 토대로 점을 찍는 함수
    func printMyPoint(myPoint : MyPoint){
        print("\(ANSICode.text.whiteBright)\(ANSICode.cursor.move(row: 25-myPoint.y, col: (myPoint.x*2)+2))*")
        print("\(ANSICode.cursor.move(row: 27, col: 25))")
    }
}

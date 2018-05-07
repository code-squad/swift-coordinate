//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
///프린트용 구조체
struct OutputView{
    
    /// 좌표축을 프린트
    func drawAxis(){
        // 화면 지우기
        print("\(ANSICode.clear)\(ANSICode.home)")
        // 좌표 그리기
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    /// 입력된 자표를 출력
    private func drawPoint(myPoints : MyPoint){
        // 표시용 특수문자
        let mark = "⦿"
        // 입력받은 위치로 커서 이동
        print("\(ANSICode.cursor.move(row:25-myPoints.y, col: myPoints.x*2+3))\(mark)")
        // 특수문자 출력
        print("\(ANSICode.cursor.move(row:26, col: 0))")
    }
    
    /// 프로토콜을 받아서 좌표축에 포인터들을 프린트
    func drawPoints(myPoints:Points){
        let points =  myPoints.getPoints()
        for point in points {
            drawPoint(myPoints: point)
        }
        print(myPoints.getMessage())
    }
}


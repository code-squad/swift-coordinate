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
    // 표시용 특수문자
    let mark = "⦿"
    
    /// 좌표축을 프린트
    func drawAxis(){
        // 화면 지우기
        print("\(ANSICode.clear)\(ANSICode.home)")
        // 좌표 그리기
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    /// 입력된 자표를 출력
    private func drawPoint(myPoint : MyPoint){
        // 입력받은 위치로 커서 이동
        print("\(ANSICode.cursor.move(row:25-myPoint.y, col: myPoint.x*2+3))\(mark)")
        // 특수문자 출력
        print("\(ANSICode.cursor.move(row:26, col: 0))")
    }
    
    /// 마이포인트 리스트를 받아서 라인이나 포인트로 바꿔서 프린트
    func draw(myPointList:Array<MyPoint>){
        for myPoint in myPointList {
            drawPoint(myPoint: myPoint)
        }
        if myPointList.count == 2 {
            let myLine = MyLine(pointA : myPointList[0], pointB : myPointList[1])
            print("두 점 사이 거리는 \(myLine.distanceBetween())")
        }
    }
}


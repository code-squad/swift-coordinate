//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    // 에러에 맞는 문구 출력
    func ErrorStatePrint(_ state: InputState){
        print(state.rawValue)
    }
    
    // 1사분면 좌표축을 그림
    func drawAxis() {
        print("\(ANSICode.text.white)\(ANSICode.axis.draw())")
    }
    
    // 모양의 점들을 화면에 출력
    func drawShape(shape: Shape) {
        print("\(ANSICode.text.yellowBright)")
        for point in shape.getPoint() {
            print("\(ANSICode.cursor.move(row: Int(25-point.yPosition), col: Int(2+2*point.xPosition)))*")
        }
        print("\(ANSICode.text.white)")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
        shapeRequirmentPrint(shape)
    }
    
    // 도형별 요구사항 구분하여 출력
    private func shapeRequirmentPrint(_ shape: Shape) {
        guard let trait = shape.calculateShapeTrait() else { return }
        switch shape.getPoint().count {
        case 2:
            print("두 점사이의 거리는 \(trait)")
        case 3:
            print("삼각형의 넓이는 \(trait)")
        default:
            return
        }
        
    }
    
    // 그리기 전 터미널 화면 Clear
    func clearBackground() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

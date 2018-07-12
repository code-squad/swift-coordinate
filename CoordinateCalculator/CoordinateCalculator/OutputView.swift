//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct OutputView{
    private static var drawQueue = [String]()
    private static func drawNewLine () {
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit + 3, col: 0))")
    }
    private static func moveCursor(row: Int, col: Int) -> String{
        return "\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + row, col: col))"
    }
    public static func drawPoint(point : MyPoint){
        drawQueue.append("\(moveCursor(row: 1 - point.y, col: point.x * 2 + 3))@");
    }
    public static func drawLine(line : MyLine){
        drawQueue.append("\(moveCursor(row: 3, col: 0))두 점 사이의 거리는 \(line.length)")
    }
    public static func drawTriangle(triangle : MyTriangle){
        drawQueue.append("\(moveCursor(row: 3, col: 0))삼각형의 면적은 \(triangle.measure)")
    }
    public static func drawRect(rect : MyRect){
        drawQueue.append(ANSICode.rect.draw(origin: rect.getCalculatedOrigin(xcal: {$0 * 2 + 3}, ycal: {ANSICode.axis.AxisLimit - $0 + 1}), size: (width: Int(rect.size.width)*2, height: Int(rect.size.height)), isFill: true))
        drawQueue.append("\(moveCursor(row: 3, col: 0))사각형의 면적은 \(rect.measure)")
    }
    public static func clear(){
        self.drawQueue.removeAll()
    }
    public static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.text.magentaBright)")
        while drawQueue.count > 0 {
            print(drawQueue.removeFirst());
        }
        print("\(ANSICode.text.normal)")
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit+3, col: 0))")
    }
}

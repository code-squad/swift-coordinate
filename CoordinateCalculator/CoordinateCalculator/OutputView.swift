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
    public static func drawShape(shape : MyShape){
        var res = "\(moveCursor(row: 3, col: 0))"
        switch shape {
        case let line as MyLine:
            res += "두 점 사이의 거리는 \(line.length)"
            break
        case let triangle as MyTriangle:
            res += "삼각형의 면적은 \(triangle.measure)"
            break
        case let rect as MyRect:
            drawQueue.append(ANSICode.rect.draw(origin: rect.getCalculatedOrigin(xcal: {$0 * 2 + 3}, ycal: {ANSICode.axis.AxisLimit - $0 + 1}), size: (width: Int(rect.size.width)*2, height: Int(rect.size.height)), isFill: true))
            res += "사각형의 면적은 \(rect.measure)"
            break
        default:
            break
        }
        drawQueue.append(res);
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

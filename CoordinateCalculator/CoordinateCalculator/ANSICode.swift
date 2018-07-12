//
//  ANSICode.swift
//  HelloSwift
//
//  Created by JK on 07/08/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

//https://en.wikipedia.org/wiki/ANSI_escape_code
public struct ANSICode {
    static let escape   = "\u{001B}["
    static let clear    = "\(escape)2J"
    static let home     = "\(escape)0;0H"
    static let none     = "\(escape)0;0m\(escape)1;0m"
    
    struct text {
        static let black   = escape + "0;30m"
        static let red     = escape + "0;31m"
        static let green   = escape + "0;32m"
        static let yellow  = escape + "0;33m"
        static let blue    = escape + "0;34m"
        static let magenta = escape + "0;35m"
        static let cyan    = escape + "0;36m"
        static let white   = escape + "0;37m"
        static let normal  = escape + "0;39m"
        static let blackBright   = escape + "1;30m"
        static let redBright     = escape + "1;31m"
        static let greenBright   = escape + "1;32m"
        static let yellowBright  = escape + "1;33m"
        static let blueBright    = escape + "1;34m"
        static let magentaBright = escape + "1;35m"
        static let cyanBright    = escape + "1;36m"
        static let whiteBright   = escape + "1;37m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)38;2;\(R);\(G);\(B)m"
        }
    }
    
    struct bgText {
        static let red     = escape + "0;41m"
        static let green   = escape + "0;42m"
        static let yellow  = escape + "0;43m"
        static let blue    = escape + "0;44m"
        static let magenta = escape + "0;45m"
        static let cyan    = escape + "0;46m"
        static let white   = escape + "0;47m"
        static let normal  = escape + "0;49m"
        static let redBright     = escape + "1;41m"
        static let greenBright   = escape + "1;42m"
        static let yellowBright  = escape + "1;43m"
        static let blueBright    = escape + "1;44m"
        static let magentaBright = escape + "1;45m"
        static let cyanBright    = escape + "1;46m"
        static let whiteBright   = escape + "1;47m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)48;2;\(R);\(G);\(B)m"
        }
    }
    
    struct cursor {
        static func move(row : Int, col : Int) -> String {
            return "\(escape)\(row);\(col)f"
        }
    }
    
    struct axis {
        static let AxisLimit = 24
        private static func drawX() -> String {
            var result = ""
            for xLoop in 1...AxisLimit {
                result += cursor.move(row: AxisLimit+1, col: xLoop*2+2)
                result += "━━"
            }
            for xLoop in 1...(AxisLimit/2) {
                result += cursor.move(row: AxisLimit+2, col: xLoop*4+1)
                result += String.init(format: "%3d", xLoop*2)
            }
            return result
        }
        
        private static func drawY() -> String {
            var result = ""
            for yLoop in 1...AxisLimit {
                result += cursor.move(row: yLoop, col: 1)
                if yLoop % 2 == 1 {
                    result += String.init(format: "%2d|", AxisLimit-yLoop+1)
                }
                else {
                    result += "  |"
                }
            }
            result += cursor.move(row: AxisLimit+1, col: 3)
            result += "+"
            result += cursor.move(row: AxisLimit+2, col: 2)
            result += "0"
            return result
        }
        
        static func draw() -> String {
            let result = drawX() + drawY()
            return result
        }
    }
    
    struct rect {
        static func draw(origin : (x:Int,y:Int), size : (width:Int,height:Int), isFill : Bool) -> String {
            var result = ""
            for yLoop in origin.y...(origin.y+size.height) {
                for xLoop in origin.x...(origin.x+size.width) {
                    result += cursor.move(row: yLoop, col: xLoop)
                    switch (xLoop,yLoop) {
                    case (origin.x, origin.y):
                        result += "┏"
                    case (origin.x+size.width,origin.y+size.height):
                        result += "┛"
                    case (origin.x, origin.y+size.height):
                        result += "┗"
                    case (origin.x+size.width,origin.y):
                        result += "┓"
                    case (origin.x, _):
                        fallthrough
                    case (origin.x+size.width, _):
                        result += "┃"
                    case (_, origin.y):
                        fallthrough
                    case (_, origin.y+size.height):
                        result += "━"
                    default:
                        if (isFill) { result += " " }
                        break
                    }
                }
            }
            return result
        }
    }
    public struct MyPoint : MyDraw {
        var x:Int = 0;
        var y:Int = 0;
        public func draw() -> String {
            return "\(ANSICode.cursor.move(row:axis.AxisLimit - y + 1, col: x * 2 + 3))@"
        }
    }
    public struct MyLine : MyDraw {
        var pointA = MyPoint(x: 0, y: 0)
        var pointB = MyPoint(x: 0, y: 0)
        var length : Double{
            get{
                let deltaX = pointB.x - pointA.x
                let deltaY = pointB.y - pointA.y
                return sqrt( Double((deltaX*deltaX) + (deltaY*deltaY)))
            }
        }
        public func draw() -> String {
            return "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))두 점 사이의 거리는 \(length)"
        }
    }
    public struct MyTriangle : MyDraw{
        var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
        var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
        var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
        init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
            lineAB = MyLine(pointA: pointA, pointB: pointB)
            lineBC = MyLine(pointA: pointB, pointB: pointC)
            lineAC = MyLine(pointA: pointA, pointB: pointC)
        }
        var cosB : Double{
            get{
                return (lineBC.length * lineBC.length + lineAB.length * lineAB.length - lineAC.length * lineAC.length) / (2 * lineBC.length * lineAB.length)
            }
        }
        var measure: Double{
            get{
                return 0.5 * lineBC.length * lineAB.length * (sqrt(1 - (cosB * cosB)))
            }
        }
        public func draw() -> String {
            return "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))삼각형의 면적은 \(measure)"
        }
    }
    public struct MyRect : MyDraw{
        var leftTop = MyPoint()
        var rightBottom = MyPoint()
        var size = CGSize()
        private func sortPointsByX(points: [MyPoint]) -> [MyPoint]{
            var sorted = [MyPoint]()
            for point in points{
                if sorted.isEmpty {
                    sorted.append(point)
                    continue
                }
                for i in 0..<sorted.count {
                    let sp = sorted[i]
                    if sp.x > point.x {
                        sorted.insert(point, at: i)
                    }else if sorted.count - 1 == i{
                        sorted.append(point)
                    }
                }
            }
            return sorted
        }
        init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, PointD: MyPoint) throws {
            var sortedArr = sortPointsByX(points: [pointA, pointB, pointC, PointD])
            let left2Points = (sortedArr.removeFirst(), sortedArr.removeFirst())
            let right2Points = (sortedArr.removeLast(), sortedArr.removeLast())

            let leftBottom, rightTop : MyPoint
            if(left2Points.0.y > left2Points.1.y){
                leftTop = left2Points.0
                leftBottom = left2Points.1
            }else{
                leftTop = left2Points.1
                leftBottom = left2Points.0
            }
            if right2Points.0.y < right2Points.1.y{
                rightBottom = right2Points.0
                rightTop = right2Points.1
            }else{
                rightBottom = right2Points.1
                rightTop = right2Points.0
            }
            if leftTop.x != leftBottom.x ||
                rightTop.x != rightBottom.x ||
                leftTop.y != rightTop.y ||
                leftBottom.y != rightBottom.y {
                throw StaticData.InputError.notRectangle
            }
            size = CGSize(width: rightBottom.x - leftTop.x, height: leftTop.y - rightBottom.y)
        }
        init(origin: MyPoint, size: CGSize) {
            leftTop = origin
            rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
            self.size = size
        }
        var measure : Int{
            get{
                return Int(size.width) * Int(size.height)
            }
        }
        public func draw() -> String {
            var result = rect.draw(origin: (x: leftTop.x * 2 + 3, y: axis.AxisLimit - leftTop.y + 1), size: (width: Int(size.width)*2, height: Int(size.height)), isFill: true)
            result += "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))사각형의 면적은 \(measure)"
            return result
        }
    }
}

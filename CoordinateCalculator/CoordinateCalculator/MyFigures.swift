//
//  MyFigures.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyFigures {
    public struct MyPoint : Figure, Equatable {
        var x = 0
        var y = 0
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(MyPoint(x: x, y: y))
            return points
        }
        
        public var description: String {
            return ""
        }
        
        public static func ==(lhs: MyFigures.MyPoint, rhs: MyFigures.MyPoint) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
    
    public struct MyLine : Figure {
        var p1 = MyPoint(x: 0, y: 0)
        var p2 = MyPoint(x: 0, y: 0)
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(p1)
            points.append(p2)
            return points
        }
        
        public var description: String {
            return "두 점 사이 거리는 \(calcDist())"
        }
        func calcDist() -> Float {
            let diffX = Double(p1.x - p2.x)
            let diffY = Double(p1.y - p2.y)
            return Float(sqrt(diffX*diffX + diffY*diffY))
        }
    }
    
    public struct MyTriangle : Figure {
        var lineAB = MyLine(p1: MyPoint(), p2: MyPoint())
        var lineBC = MyLine(p1: MyPoint(), p2: MyPoint())
        var lineAC = MyLine(p1: MyPoint(), p2: MyPoint())
        
        init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) throws {
            lineAB = MyLine(p1: pointA, p2: pointB)
            lineBC = MyLine(p1: pointB, p2: pointC)
            lineAC = MyLine(p1: pointA, p2: pointC)
            
            if(lineAB.calcDist() == 0 || lineBC.calcDist() == 0 || lineAC.calcDist() == 0) {
                throw InputView.InputError.InvalidTriangle
            }
        }
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(lineAB.p1)
            points.append(lineAB.p2)
            points.append(lineAC.p2)
            return points
        }
        
        public var description: String {
            return "삼각형 넓이는 \(calcArea())"
        }
        
        private func calcArea() -> Float {
            let distA = lineBC.calcDist()
            let distB = lineAC.calcDist()
            let distC = lineAB.calcDist()
            let cosB = (distA*distA + distC*distC - distB*distB) / (2*distA*distC)
            let sinB = sqrt(1 - pow(cosB, 2))

            return Float(distA * distC * sinB / 2)
        }
    }
    
    struct MyRect : Figure {
        var leftTop = MyPoint()
        var rightBottom = MyPoint()
        
        init(origin: MyPoint, size: CGSize) {
            leftTop = origin
            rightBottom = MyPoint(x:origin.x + Int(size.width), y:origin.y - Int(size.height))
        }
        
        static func getRectConfig(points : [MyPoint]) throws -> (MyPoint, CGSize) {
            var left = Int.max, top = 0
            
            var widthSet = Set<Int>()
            var heightSet = Set<Int>()
            for i in 0..<points.count {
                for j in 1..<points.count {
                    if(i == j) {
                        continue
                    }
                    if(points[i] == points[j]) {
                        throw InputView.InputError.InvalidRect
                    }
                    widthSet.insert(abs(points[i].x - points[j].x))
                    heightSet.insert(abs(points[i].y - points[j].y))
                }
                left = min(points[i].x, left)
                top = max(points[i].y, top)
            }
            
            guard let width = widthSet.max() else {
                throw InputView.InputError.InvalidRect
            }
            if(!(widthSet.contains(0) && widthSet.count == 2)) {
                throw InputView.InputError.InvalidRect
            }
            
            guard let height = heightSet.max() else {
                throw InputView.InputError.InvalidRect
            }
            if(!(heightSet.contains(0) && heightSet.count == 2)) {
                throw InputView.InputError.InvalidRect
            }
            
            return (MyPoint(x:left, y:top), CGSize(width: width, height: height))
        }
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(leftTop)
            points.append(MyPoint(x: rightBottom.x, y: leftTop.y))
            points.append(rightBottom)
            points.append(MyPoint(x: leftTop.x, y: rightBottom.y))
            return points
        }
        
        var description: String {
            return "사각형 넓이는 \(calcArea())"
        }
        
        private func calcArea() -> Int {
            return (rightBottom.x - leftTop.x) * (leftTop.y - rightBottom.y)
        }
    }
}


protocol Figure : CustomStringConvertible {
    func getPoints() -> [MyFigures.MyPoint]
}

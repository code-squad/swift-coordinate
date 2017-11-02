//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 1..
//

import Foundation

struct MyRect{
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
}

extension MyRect: FigureCalculatable{
    // 파라미터로 받은 점을 이용해 구조체 생성하여 반환.
    init(from points: [MyPoint]) throws {
        guard MyRect.isRectangle(by: points) else { throw OutputView.CoordsError.invalidRectPoints }
        let leftTop = MyRect.calculateLeftTop(in: points)
        let size = MyRect.calculateSize(of: points)
        self = MyRect(origin: leftTop, size: size)
    }
    
    // 생성된 구조체의 모든 점 반환.
    func getPoints() -> [MyPoint] {
        var owningPoints: [MyPoint] = []
        owningPoints.append(self.leftTop)
        owningPoints.append(self.rightBottom)
        owningPoints.append(MyPoint(x: self.leftTop.x, y: self.rightBottom.y))
        owningPoints.append(MyPoint(x: self.rightBottom.x, y: self.leftTop.y))
        return owningPoints
    }
    
    // 사각형 넓이 계산.
    func calculate() -> Double {
        let width = self.rightBottom.x - self.leftTop.x
        let height = self.leftTop.y - self.rightBottom.y
        return Double(width * height)
    }
}

extension MyRect {
    // 네 점의 x좌표, y좌표를 각각 세트에 넣어 반환.
    private static func getRectPoints(in points: [MyPoint]) -> (Set<Int>, Set<Int>){
        var xSet = Set<Int>()
        var ySet = Set<Int>()
        // 모든 점들을 x세트, y세트로 나눠 모음.
        for point in points{
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return (xSet, ySet)
    }
    
    // 직사각형 형태인지 판별.
    static func isRectangle(by points: [MyPoint]) -> Bool{
        // 네 점의 x, y 좌표 세트를 받아옴.
        let (xSet, ySet) = getRectPoints(in: points)
        // Set 타입은 중복 허용 안 함. 직사각형은 x 또는 y 좌표가 2개 수로 한정됨. 2개가 아닌 경우 false 반환.
        guard xSet.count == 2 && ySet.count == 2 else { return false }
        return true
    }
    
    // 좌상단의 점을 반환.
    static func calculateLeftTop(in points: [MyPoint]) -> MyPoint{
        // 좌상단 점의 값은 x좌표 중 가장 작은 값, y좌표중 가장 큰 값이 됨.
        return MyPoint(x: getRectPoints(in: points).0.min()!, y: getRectPoints(in: points).1.max()!)
    }
    
    // 사각형의 가로, 세로 길이 반환.
    static func calculateSize(of points: [MyPoint]) -> CGSize{
        // x,y 좌표별로 큰 값에서 작은 값을 뺌.
        return CGSize(width: getRectPoints(in: points).0.max()! - getRectPoints(in: points).0.min()!,
                      height: getRectPoints(in: points).1.max()! - getRectPoints(in: points).1.min()!)
    }
}

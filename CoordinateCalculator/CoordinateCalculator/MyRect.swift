//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 12. 5..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: MyShape, ShapeCalculation {
    private var leftTop = MyPoint(x: 0, y: 0)
    private var rightBottom = MyPoint(x: 0, y: 0)
    private var origin = MyPoint(x: 0, y: 0)  // leftBottom
    private var size = CGSize(width: 0, height: 0) // CGsize : 너비와 높이 값을 포함하는 구조체
    
    // 오리진과 사이즈 생성자
    init(origin: MyPoint, size: CGSize) {
        self.origin = origin
        self.size = size
    }
    
    // 오리진 사이즈 생성자 초기화 위임한 [MyPoint] 생성자
    init (points: [MyPoint]) {
        self.init(origin: points[0],
                  size: CGSize(width: CGFloat(points[2].x) - CGFloat(points[0].x), height: CGFloat(points[3].y) - CGFloat(points[0].y)))
        self.leftTop = points[3]
        self.rightBottom = points[1]
    }
    
    // 사각형 점찍는 메서드
    func makeCoordinates() -> [MyPoint] {
        return [MyPoint(x: leftTop.x, y: rightBottom.y),
                         rightBottom,
                         MyPoint(x: rightBottom.x, y: leftTop.y),
                         leftTop]
    }
    
    func calculate() -> Double {
        return Double(size.width) * Double(size.height)
    }
    
    var resultDescription: String = {
        return "직사각형의 면적은 : "
    }()
    
    // 위 아래 변의 길이를 비교, 같다면 완전한 직사각형
    static func isPerpectRectangle(_ points: [MyPoint]) -> Bool {
        let lengthOfBottomLine = MyLine(pointA: points[0], pointB: points[1]).calculate()
        let lengthOfTopLine = MyLine(pointA: points[3], pointB: points[2]).calculate()
        guard lengthOfBottomLine == lengthOfTopLine else { return false }
        return true
    }
}

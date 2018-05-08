//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 5. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 사각형 구조체
struct MyRect : Points{
    // 속성 선언
    private var leftTop = MyPoint(x: 0, y: 0)
    private var rightBottom = MyPoint(x: 0, y: 0)
        
    // 생성자
    init(origin: MyPoint, size: CGSize) {
        // 기준점은 오리진
        self.leftTop = origin
        // 기준점 x 에 가로를 더하고 y 에 세로를 더해서 생성
        self.rightBottom = MyPoint(x: origin.getXAxis() + Int(size.width), y: origin.getYAxis() + Int(size.height))
    }
    
    /// 넓이를 계산해서 리턴
    func calculateArea()->Int{
        // 가로 길이
        let width = self.rightBottom.getXAxis() - self.leftTop.getXAxis()
        // 세로 높이
        let height = self.leftTop.getYAxis() - self.rightBottom.getYAxis()
        // 길이 * 높이 를 리턴
        return width * height
    }
    
    // 프로토콜 준수
    // 넓이를 출력하는 문자열 리턴
    func getMessage() -> String {
        return ("사각형의 넓이는 \(calculateArea())")
    }
    
    /// 사각형의 꼭지점들을 리턴
    func getPoints() -> [MyPoint] {
        // 왼쪽 밑 꼭지점
        let leftBottom = MyPoint(x: leftTop.getXAxis(), y: rightBottom.getYAxis())
        // 오른쪽 위 꼭지점
        let rightTop = MyPoint(x: leftTop.getYAxis(), y: rightBottom.getXAxis())
        // 네 꼭지점 리턴
        return [leftTop,rightBottom,leftBottom,rightTop]
    }
}

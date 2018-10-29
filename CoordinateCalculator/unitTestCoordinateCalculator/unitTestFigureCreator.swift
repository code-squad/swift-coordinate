//
//  unitTestFigureCreator.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class unitTestFigureCreator: XCTestCase {
    let figureCreator = FigureCreator()
    
    func testMakeFigureMyPoint() {
        // 도형 생성의 결과 : 하나의 좌표
        
        let input = "(10,10)"
        let figure = figureCreator.makeFigure(rawPoint: input)
        XCTAssertNotNil(figure)
    }
    
    func testMakeFigureMyLine() {
        // 도형 생성의 결과 : 하나의 좌표
        
        let input = "(10,10)-(14,15)"
        let figure = figureCreator.makeFigure(rawPoint: input)
        XCTAssertNotNil(figure)
    }
    
    func testMakeFigureMyTriangle() {
        // 도형 생성의 결과 : 하나의 좌표
        
        let input = "(10,10)-(14,15)-(20,8)"
        let figure = figureCreator.makeFigure(rawPoint: input)
        XCTAssertNotNil(figure)
    }
    
    func testMakeFigureMyRect() {
        // 도형 생성의 결과 : 하나의 좌표
        
        let input = "(10,10)-(22,10)-(22,18)-(10,18)"
        let figure = figureCreator.makeFigure(rawPoint: input)
        XCTAssertNotNil(figure)
    }
}

//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    
    let target:Figure
    
    init(_ target:Figure) {
        self.target = target
    }
    private func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.cyanBright)\(ANSICode.axis.draw())")
    }
    
    private func draw(point:MyPoint) {
        let row = ANSICode.convertY(point.y)
        let col = ANSICode.convertX(point.x)
        let color = ANSICode.text.colorFrom(R:255,G:127,B:0)
        print("\(ANSICode.cursor.move(row:row , col: col ))\(color)\(ANSICode.dot)")
        ANSICode.moveCurser()
    }
    
    func draw( _ figure : Figure ) {
        drawAxis()
        _ = figure.getPoints().map{
            point in
            draw(point: point)
        }
        explain(figure)
    }
    
    func explain(_ figure:Figure){
        guard let calculable = figure as? Calculable else { return }
        print("\(calculable.explanation)\(calculable.getCalculatedValue())")
    }
}

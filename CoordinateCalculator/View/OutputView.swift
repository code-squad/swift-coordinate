//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation
struct OutputView {
    
    private var figure: BaseProtocol
    
    init(_ figure: BaseProtocol) {
        self.figure = figure
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func errorMessage(of type: CoordinateError) {
        print("Coordinate Error : \(type.rawValue)")
    }
    
    static func questionMessge(msg question: String) {
        print(question)
    }
    
    private func drawPoint(_ mypoint: MyPoint) {
        let zeropointX = 3
        let zeropointY = ANSICode.axis.AxisLimit + 1
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: zeropointY - mypoint.y , col: zeropointX + mypoint.x * 2))\(CODRDINATE_CURSOR)")
    }
    
    func draw() {
        for mypoint in self.figure.getPoints() {
            drawPoint(mypoint)
        }
    }
    
    func distance(_ figure: FigureProtocol) {
        print("\n\(figure.description) \(figure.figureCalculation())\n")
    }
    
    func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

}

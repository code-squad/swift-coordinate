//
//  FigureCalculate.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 31..
//

import Foundation

protocol FigureCalculate{
    func calculate() -> Double
}

protocol UserInputReadable{
    static func readInput<T>(rawCoords: String) throws -> T
    static func generateFigures<T>(from points: [MyPoint]) -> T
}

protocol Printer{
    static func printNumerousHearts<T>(inShape userFigure: T?)
    static func printDescription<T>(of userInput: T)
    static func printHeart<T>(from userInput: T)
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func askPoint() -> MyPoint {
        do {
            let point = try readPointInput()
            if point.isValid { return point }
            return askPoint()
        } catch {
            return askPoint()
        }
    }
    
    static func askLine() -> MyLine {
        do {
            let line = try readLineInput()
            if line.isValid { return line }
            return askLine()
        } catch {
            return askLine()
        }
    }
    
    static func askTriangle() -> MyTriangle {
        do {
            let triangle = try readTriangleInput()
            if triangle.isValid { return triangle }
            return askTriangle()
        } catch {
            return askTriangle()
        }
    }
    
    static func readPointInput() throws -> MyPoint {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        do {
            let point = try StringConverter.convertToPoint(str: inputString)
            return point
        } catch {
            throw CoordinateError.stringConvert
        }
    }
    
    static func readLineInput() throws -> MyLine {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        do {
            let line = try StringConverter.convertToLine(str: inputString)
            return line
        } catch {
            throw CoordinateError.stringConvert
        }
    }
    
    static func readTriangleInput() throws -> MyTriangle {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        do {
            let triangle = try StringConverter.convertToTriangle(str: inputString)
            return triangle
        } catch {
            throw CoordinateError.stringConvert
        }
    }
}


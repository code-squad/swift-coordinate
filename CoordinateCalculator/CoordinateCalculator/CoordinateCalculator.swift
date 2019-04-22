//
//  CoordinatePlane.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalCulator {
    
    //MARK: Views
    private var textView = TextView()
    /// 표시 가능한 좌표 범위
    private var coordinateRange = 0...ANSICode.CoordinateGrid.gridLimit
    
    private var shapes = [Drawable]()
    
    init() {
        CoordinateView.drawCoordinatePlane()
    }
    
    /// 좌표 평면에 도형을 추가합니다. 표시할 수 없는 범위이면 오류를 발생시킵니다.
    private mutating func add(_ shape: Drawable) throws {
        guard shape.isDrawable else {
            throw CoordinateCalculatorError.axisLimitExceeded
        }
        shapes.append(shape)
        shape.draw()
        //TODO: 설명 입력하기
        textView.printText("")
    }
    
    
    /// 점 배열에서 도형을 반환합니다.
    ///
    /// - Parameter points: 도형화할 점의 배열입니다.
    /// - Returns: 점의 개수가 지원되는 도형인 경우에 도형을 반환합니다.
    private func shaping(points: [Point]) -> Drawable? {
        switch points.count {
        case 2:
            return Line(start: points[0], end: points[1])
        default:
            return nil
        }
    }
    
    /// 점과 도형을 구분하여 좌표에 추가합니다.
    private mutating func addIdentifiedShape(points: [Point]) throws {
        if let shape = shaping(points: points) {
            try add(shape)
        } else {
            for point in points {
                try add(point)
            }
        }
    }
    
    
    
    /// 좌표를 읽고 도형을 구분하여 좌표에 추가합니다.
    mutating func readCoordinatesAndAdd() {
        do {
            let points = try textView.readCoordinates()
            try addIdentifiedShape(points: points)
        } catch let error as InputError {
            textView.printText("입력 오류: \(error.description)")
        } catch let error as CoordinateCalculatorError {
            textView.printText("좌표 오류: \(error.description)")
        } catch {
            textView.printText("예상치 못한 오류: \(error)")
        }
    }
    
}

enum CoordinateCalculatorError: CustomStringConvertible, Error {
    
    case axisLimitExceeded
    
    var description: String {
        switch self {
        case .axisLimitExceeded:
            return "좌표축 제한 초과함"
        }
    }
    
}

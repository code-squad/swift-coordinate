//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// ConvertInput 구조체의 역할
// 입력 형태에 따라 정수형 좌표로 변환하고 전달

struct FigureCreator {
    
    // 초기 입력을 '-'을 기준으로 분리해주는 메소드
    // "(10,10)-(10,10)" -> ["(10,10)", "(10,10)"]
    private func separate(_ input: String) -> [String] {
        return input.split(separator: "-").map {String($0)}
    }
    
    // 분리된 초기 입력 배열의 요소를 다시 ','을 기준으로 분리해주는 메소드
    // "(10,10)" -> ["10","10"]
    private func transform(_ point: String) -> [String] {
        var coordinates = point
        coordinates = coordinates.removeBracket()
        return coordinates.split(separator: ",").map {String($0)}
    }
    
    // 분리된 배열의 요소들로 이중배열을 만들어주는 메소드
    // ["(10,10)", "(10,10)"] -> [["10","10"], ["10","10"]]
    private func makeRawPointsWith(_ separatedCoordinates: [String]) -> [[String]] {
        var rawPoints: [[String]] = []
        
        separatedCoordinates.forEach {
            rawPoints.append(transform($0))
        }
        return rawPoints
    }
    
    // 배열의 요소들을 MyPoint에 구조체에 넣어 좌표를 리턴하는 메소드
    // ["10", "10"] -> MyPoint(x: 10, y: 10)
    private func makeMyPointWith(rawPoints: [String]) -> MyPoint {
        return MyPoint(x: Int(rawPoints[0]) ?? -1, y: Int(rawPoints[1]) ?? -1)
    }
    
    // 초기 입력값을 튜플로 좌표쌍으로 리턴하는 메소드
    // "(10,10)-(14,15)" -> [MyPoint(x: 10, y: 10), MyPoint(x: 14, y: 15)]
    private func makePointsWith(_ rawPoint: String) -> [MyPoint] {
        let separated = separate(rawPoint)
        let rawPoints = makeRawPointsWith(separated)        // ["(10,10)", "(10,10)"] -> [["10","10"], ["10","10"]]
        var points: [MyPoint] = []
        
        rawPoints.forEach {
            points.append(makeMyPointWith(rawPoints: $0))   // ["10", "10"]           -> MyPoint(x: 10, y: 10)
        }                                                   // ["14", "15"]           -> MyPoint(x: 14, y: 15)
        
        return points                                       // [MyPoint(x: 10, y: 10), MyPoint(x: 14, y: 15)]
    }
    
    private func computeSize(of points: [MyPoint]) -> CGSize {
        let width = points[1].xPoint() - points[0].xPoint()
        let height = points[1].yPoint() - points[2].yPoint()
        print(width, height)
        
        return CGSize(width: width, height: height)
    }
    
    // 생성된 도형(Figure)을 전달해주는 메소드
    // "(10,10)"                            -> MyPoint
    // "(10,10)-(14,15)"                    -> MyLine
    // "(10,10)-(14,15)-(20,21)"            -> MyTriangle
    // "(10,10)-(14,15)-(20,21)-(24,24)"    -> MyRect
    public func makeFigure(rawPoint: String) -> Figure {
        let separated = separate(rawPoint)
        
        switch separated.count {
        case 2:
            let line = makePointsWith(rawPoint)
            return MyLine(pointA: line[0], pointB: line[1])
        case 3:
            let triangle = makePointsWith(rawPoint)
            return MyTriangle(pointA: triangle[0], pointB: triangle[1], pointC: triangle[2])
        case 4:
            let rectangle = makePointsWith(rawPoint)
            let cgsize = computeSize(of: rectangle)
            return MyRect(origin: rectangle[0], size: cgsize)
        default:
            let myPoint = makePointsWith(rawPoint)
            return myPoint[0]
        }
    }
}

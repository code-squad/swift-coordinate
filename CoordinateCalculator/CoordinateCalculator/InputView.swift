//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var inputCoordinateValue: String = ""
    private let validCharacterSet: Set<Character> = ["0","1","2","3","4",
                                                     "5","6","7","8","9",
                                                     "(",")",",","-"]
    private var separatePoints: [String] = []
    
    mutating func readInput() throws {
        print("좌표를 입력하세요.")
        let inputPoints = readLine()
        guard let inputCoordinateValue = inputPoints else {
            print("다시입력해주세요.")
            return
        }
        if divideAndCheck(inputCoordinateValue) {
            print("입력가능한 문자는 ( , ) - 와 0~9인 숫자입니다. :)")
            throw InputViewError.invalidCharacterSet
        }
        self.inputCoordinateValue = inputCoordinateValue
    }
    
    private func confirm(points: [Int]) -> Bool {
        if points.isEmpty || points.count == 1{
            print("다시입력해주세요. 괄호안에는 정수가 와야합니다. :)")
            return false
        }
        for index in 0...1 {
            if points[index] < 0 || points[index] > 24 {
                print("x,y 값은 0 <= x,y <= 24 합니다. :) 다시입력해주세요.")
                return false
            }
        }
        return true
    }
    
    //입력된 값을 쪼개어 Set<Character>로 변환후 isDisjoint 메소드를 이용하여 입력가능한 Set인지 구별한다.
    //validCharacterSet에 포함된 값이라면 false 를 반환하는 메소드다.
     private func divideAndCheck(_ value: String) -> Bool {
        var disassembleValue: [Character] = []
        for valueIndex in 0..<value.count {
            disassembleValue.append(value[value.index(value.startIndex, offsetBy: valueIndex)])
        }
        let disassembleSetOfValue: Set<Character> = Set(disassembleValue)
        let checkValueSet = validCharacterSet.isDisjoint(with: disassembleSetOfValue)
        return checkValueSet
    }
    
   private mutating func countPointsValue() -> PointsInfo {
        separatePoints = inputCoordinateValue.components(separatedBy: "-")
        var separatePointInfo: PointsInfo {
            get {
                switch separatePoints.count{
                case 1:
                    return PointsInfo.point
                case 2:
                    return PointsInfo.line
                default:
                    return PointsInfo.point
                }
            }
        }
        return separatePointInfo
    }
    
    mutating func extract(_ pointModel: CoordinateModel) throws {
        pointModel.pointsKind = countPointsValue()
        var dotPoints: [MyPoint] = [MyPoint()]
        dotPoints.remove(at: 0)
        for pointsIndex in 0..<separatePoints.count {
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].startIndex)
            separatePoints[pointsIndex].remove(at: separatePoints[pointsIndex].index(before: separatePoints[pointsIndex].endIndex))
            let separateAxisValue = separatePoints[pointsIndex].components(separatedBy: ",").flatMap{ Int($0) }
            if confirm(points: separateAxisValue) {
                var dotPoint = MyPoint()
                dotPoint.x = separateAxisValue[0]
                dotPoint.y = separateAxisValue[1]
                dotPoints.append(dotPoint)
            } else {
                throw InputViewError.invalidPoint
            }
        }
        pointModel.trixInfo.point = dotPoints
    }
    
}

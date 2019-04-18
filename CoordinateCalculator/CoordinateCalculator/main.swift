//
//  main.swift
//  CoordinateCalculator
//
//  Created by Joon-ho Kil on 04/17/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case inputNonStandard
    case coordinateNonStandard
    
    private var manual: String {
        switch self {
        case .inputNonStandard: return "소괄호로 둘러싸인 x,y 좌표를 정확히 입력해주세요. ex: (4,16)"
        case .coordinateNonStandard: return "x,y 좌표는 0부터 24까지 입력해주세요."
        }
    }
}

//MARK: Struct
struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row:25-point.y, col: point.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
    }
}

struct InputView {
    var point = MyPoint()
    var valueEntered: String = ""
    
    mutating func readInput () {
        print("좌표를 입력하세요.")
        valueEntered = readLine() ?? "0"
    }
    
    mutating func inputToCoordinate () throws {
        var value = valueEntered
        if value.removeFirst() != "(" || value.removeLast() != ")" {
            throw InputError.inputNonStandard
        }
        var coordinate = value.split(separator: ",")
        if coordinate.count != 2 {
            throw InputError.inputNonStandard
        }
        
        guard let pointX = Int(coordinate[0]), pointX >= 0 && pointX <= 24 else {
            throw InputError.coordinateNonStandard
        }
        guard let pointY = Int(coordinate[1]), pointY >= 0 && pointY <= 24 else {
            throw InputError.coordinateNonStandard
        }
        point.x = pointX
        point.y = pointY
    }
}

struct MyPoint {
    var x = 0
    var y = 0
}

//MARK: Function
func main () {
    let outputView = OutputView()
    outputView.drawAxis()
}

main()


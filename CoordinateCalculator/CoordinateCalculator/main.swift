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


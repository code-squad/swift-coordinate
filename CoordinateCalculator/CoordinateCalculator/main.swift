//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()

while(true) {
    do {
        guard let figure = try inputView.readInput() else { break }
        switch figure {
        case .point : OutputView.prints(point: inputView.point)
        case .line : OutputView.prints(line: inputView.line)
        case .triangle: OutputView.prints(triangle: inputView.triangle)
        }
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표 값은 24 이하로 입력해 주세요.")
    } catch InputError.outOfCoordinate {
        print("좌표의 개수는 3개 이하로 입력해 주세요.")
    }
}

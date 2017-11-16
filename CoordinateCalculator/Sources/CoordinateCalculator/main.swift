//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while(true) {
    do {
        let inputValue = try InputView().readInput()
        
        guard inputValue.count > 0 else {
            print("프로그램이 종료되었습니다.")
            break
        }
        
        try OutputView.moveCoordinates(in: inputValue)
        
    } catch let error as InputView.Errors {
        print(error.rawValue)
    } catch let error as OutputView.Errors {
        print(error.rawValue)
    }
}





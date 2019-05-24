//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by JH on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation



struct  InputView {
    
    static func ask(about question: String) -> String {
        print(question)
        let input = readLine() ?? "" //nil병합연산자
        return input
    }
    
}

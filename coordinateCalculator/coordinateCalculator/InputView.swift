//
//  InputView.swift
//  coordinateCalculator
//
//  Created by JINA on 27/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

//좌표를 입력받음
struct InputView {
    static func readInput() -> String {
        print("좌표를 입력하세요 (x,y)")
        guard let input = readLine() else{
            return ""
        }
        return input
    }
}

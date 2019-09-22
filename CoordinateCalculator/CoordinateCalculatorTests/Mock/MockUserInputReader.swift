//
//  MockUserInputView.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MockUserInputReader: UserInputReadable {
    static var inputs = [""]
    static var pos = 0
    
    func read(with prompt: Prompt) -> String {
        if MockUserInputReader.pos < MockUserInputReader.inputs.count {
            let result = MockUserInputReader.inputs[MockUserInputReader.pos]
            MockUserInputReader.pos += 1
            return result
        }
        return ""
    }
}

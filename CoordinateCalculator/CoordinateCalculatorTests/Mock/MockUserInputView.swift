//
//  MockUserInputView.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MockUserInputView: UserInputReadable {
    static var inputs = [""]
    static var pos = 0
    
    func read(with prompt: Prompt) -> String {
        let result = MockUserInputView.inputs[MockUserInputView.pos]
        MockUserInputView.pos += 1
        return result
    }
}

//
//  CoordinateInputView.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum Prompt {
    case read
    case retry(error: String)
    case finish
    
    var description: String {
        switch self {
        case .read                  : return "> 좌표를 입력하세요.형식:(10,10)"
        case .retry(let error)      : return "> \(error). 다시 입력해 주세요."
        case .finish                : return "> 입력을 끝내시겠습니까? (y/n)"
        }
    }
}

struct CoordinateInputView {
    static func read(with prompt: Prompt) -> String {
        print(prompt.description)
        return readLine() ?? ""
    }
}

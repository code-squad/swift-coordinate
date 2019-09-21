//
//  UserInputView.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum Prompt {
    case read
    case retry(error: LocalizedError)
    case finish
    
    var description: String {
        switch self {
        case .read                  : return "> 좌표를 입력하세요.형식:(10,10)"
        case .retry(let error)      :
            guard let errorDescription = error.errorDescription else {
                return "> 다시 입력해 주세요."
            }
            return "> \(errorDescription). 다시 입력해 주세요."
        case .finish                : return "> 입력을 끝내시겠습니까? (y/n)"
        }
    }
}

protocol UserInputReadable {
    func read(with prompt: Prompt) -> String
}

struct UserInputView: UserInputReadable {
    func read(with prompt: Prompt) -> String {
        print(prompt.description)
        return readLine() ?? ""
    }
}

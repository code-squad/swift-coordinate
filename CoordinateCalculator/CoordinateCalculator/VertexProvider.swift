//
//  UserInputView.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol VertexProvidable {
    func readVertices() throws -> [(x: Int, y: Int)]
}

struct VertexProvider: VertexProvidable {
    
    var retry: Int = 3
    private let parser: UserInputParsable
    private let reader: UserInputReadable
    
    init(reader: UserInputReadable, parser: UserInputParsable) {
        self.parser = parser
        self.reader = reader
    }
    
    func readVertices() throws -> [(x: Int, y: Int)] {
        var points: [(x: Int, y: Int)] = []
        var prompt: Prompt = .read
        
        for _ in 0..<retry {
            let userInput = reader.read(with: prompt)
            do {
                let result = try parser.parse(userInput: userInput)
                points = result
                break
            }
            catch {
                let message = "입력형식:(10,10) 입력:\(userInput)]"
                prompt = .retry(error: UserInputError.wrongInputFormat(message: message))
                continue
            }
        }
        if points.count == 0 {
            throw UserInputError.exceedMaxUserInput
        }
        return points
    }

}

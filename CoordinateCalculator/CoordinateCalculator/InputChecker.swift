//
//  InputScanner.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case nilInput
    case invalidInput
    case regexError
    
    var localizedDescription: String {
        switch self {
        case .nilInput:
            return "입력이 비었습니다."
        case .invalidInput:
            return "잘못된 입력입니다."
        case .regexError:
            return "정규표현식이 잘못되었습니다."
        }
    }
}

struct InputChecker {
    
    private let hyphen: Character = "-"
    private let meaninglessCharacters: CharacterSet = ["(", ")", ","]
    static private let validPattern: String = "\\(([1-9]|1[0-9]|2[0-4]),([1-9]|1[0-9]|2[0-4])\\)-?"
    
    // 입력에 좌표문자열패턴이 있는지 검사
    static func checkMatching(text: String) throws -> Bool {
        guard let regex = try? NSRegularExpression(pattern: self.validPattern) else {
            throw InputError.regexError
        }
        
        let numberOfMatches = regex.numberOfMatches(in: text, options: [],
                                                    range: NSMakeRange(0, text.count))
        
        // 입력된 좌표수 체크
        return numberOfMatches < 1 || numberOfMatches > 2
    }
    
    func getMyPoints(_ userInput: String) -> [MyPoint] {
        let splited: [String] = self.splitByHyphen(in: userInput)
        let coordinates: [[Int]] = self.getCoordinateFrom(textCoordinates: splited)
        let myPoints: [MyPoint] = self.makeMyPoint(coordinates)
        
        return myPoints
    }
    
    private func splitByHyphen(in text: String) -> [String] {
        return text.split(separator: hyphen).map(String.init)
    }
    
    private func getCoordinateFrom(textCoordinates: [String]) -> [[Int]] {
        var coordinates = [[Int]]()
        for textCoordinate in textCoordinates {
            coordinates.append(textCoordinate.components(separatedBy: self.meaninglessCharacters).compactMap { Int($0) })
        }
        
        return coordinates
    }
    
    private func makeMyPoint(_ coordinates: [[Int]]) -> [MyPoint] {
        var myPoints = [MyPoint]()
        
        for coordinate in coordinates {
            myPoints.append(MyPoint(x: coordinate[0], y: coordinate[1]))
        }
        
        return myPoints
    }
    
}


// NSRange로부터 String을 만들기 위해 서브스크립트 사용
extension String {
    public subscript(range: NSRange) -> String {
        let start = self.index(self.startIndex, offsetBy: range.location)
        let end = self.index(start, offsetBy: range.length)
        
        return String(self[start..<end])
    }
}

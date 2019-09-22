//
//  PointChecker.swift
//  CoordinateCalculator
//
//  Created by 공명진 on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Cocoa

enum PointCheckerError: Error {
    case invalidRange
    case invalidFormat
    case wrongPointCount
}

struct PointChecker {
    private let customCharacterSet = CharacterSet(charactersIn: "-,()")
    
    fileprivate func checkFormat(formular: String) -> Bool {
        var result = false

        var characterSet = customCharacterSet
        characterSet.formUnion(CharacterSet.decimalDigits)

        if formular.trimmingCharacters(in: characterSet).count == 0 {
            result = true
        }
        return result
    }

    fileprivate func checkPointNumber(formular: String) -> Bool {
        var result = false

        let points = formular.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        if points.count % 2 == 0 {
            result = true
        }
        return result
    }
    
    fileprivate func checkRange(formular: String) -> Bool {
        var result = false

        let points = formular.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        let x = Int(points[0]) ?? -1, y = Int(points[1]) ?? -1

        if (0 < x && x <= 24), (0 < y && y <= 24) {
            result = true
        }
        return result
    }

    func checkPoint(formular: String) throws -> Point {
        if checkFormat(formular: formular) == false {
            throw PointCheckerError.invalidFormat
        }
        if checkPointNumber(formular: formular) == false {
            throw PointCheckerError.wrongPointCount
        }
        if checkRange(formular: formular) == false {
            throw PointCheckerError.invalidRange
        }
        let points = formular.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        return Point(Int(points[0])!, Int(points[1])!)
    }
}

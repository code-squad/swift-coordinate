//
//  Spliter.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 9..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Spliter {
    typealias type = (MyPoint, MyLine)
    // "(1,1)" -> [1, 1]
    static func splitSaveFormat(_ format: String) throws -> [Int]{
        let unCapsuleFormat = deleteCapsule(format)
        let saveFormat = unCapsuleFormat.split(separator: ",").map{ String($0) }.compactMap{ Int($0) }
        
        guard saveFormat.count == 2 else {
            throw CoordinateError.splitError
        }
        
        return saveFormat
    }
    
    // "(1,1)" -> "1,1"
    static private func deleteCapsule(_ capsuleFormate: String) -> String {
        let capsule: CharacterSet = ["(", ")"]
        return capsuleFormate.components(separatedBy: capsule).joined()
    }
}

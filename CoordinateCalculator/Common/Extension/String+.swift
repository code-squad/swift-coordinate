//
//  String+.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

extension String {
    func splitDobulePoint() -> [String] {
        return self.split(separator: "-").map{ String($0) }
    }
    
}

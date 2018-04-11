//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    let cutter = Cutter()
    let testStr = ANSICode.axis.draw()
    print(testStr)
    let axisDrawPattern = "[0-9]{1,2};[0-9]{1,2}[ft]([━]*[\\s]*[0-9]*\\|?\\+?)"
    guard let result = cutter.makeRegexFrom(wannaBeRegex: axisDrawPattern, originLatters: testStr) else {
        return
    }
    print(result)
}

main()

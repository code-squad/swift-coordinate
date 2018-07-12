//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

// test QnA: CLI에서 swift file 실행하는 법을 모르겠어요(예: main.swift나 OutView.swift에 ANSICode.swift 구조체 메쏘드를 구현해서 실행)

import Foundation

print("Hello, World!")

print("\(ANSICode.clear)\(ANSICode.home)")

print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")

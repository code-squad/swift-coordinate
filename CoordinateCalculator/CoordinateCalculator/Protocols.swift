//
//  Protocols.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 5. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 좌표를 받아서 포인터 객체를 리턴하기 위한 프로토콜 선언
protocol Points{
    // 좌표가 몇개든 마이포인트 배열로 리턴 
    func getPoints()->[MyPoint]
    func getMessage()->String
}

//
//  Datas.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public protocol MyDraw {
    func draw() -> String   
}
public struct StaticData{
    enum InputError : Error {
        case unknown
        case empty
        case not2D
        case notInt
        case outRange
        case notRectangle
    }
    static let ErrStrDict : [InputError : String] = [
        InputError.unknown : "알 수 없 는 오 류",
        InputError.empty : "입 력 없 음",
        InputError.not2D : "2 차 원 좌 표 만",
        InputError.notInt : "정 수 만",
        InputError.outRange : "0 부 터 2 4 까 지",
        InputError.notRectangle : "직 사 각 형 아 님"
    ];
}

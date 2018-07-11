//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct InputView{
    static func printErr(errType : StaticData.InputError){
        var errString = "알 수 없는 에러 : \(errType)";
        if let errStr = StaticData.ErrStrDict[errType]{
            errString = errStr
        }
        print(errString);
    }
    static func selectMode() -> StaticData.RunMode{
        print("선택 : \n1. 좌표 입력과 출력 \n2. 직선 입력과 출력")
        var m : StaticData.RunMode = StaticData.RunMode.none
        repeat{
            if let read = readLine(), let i = Int(read){
                switch i {
                case 1 :
                    m = StaticData.RunMode.point
                case 2:
                    m = StaticData.RunMode.line
                default:
                    print("그런 모드 없음")
                }
            }
        }while(m == StaticData.RunMode.none)
        return m
    }
    static func readInput() throws -> String{
        print("좌 표 입 력 : (x1, y1)-(x2, y2)-...-(xn, yn)")
        let read = readLine();
        if let read = read {
            return read
        }else{
            throw StaticData.InputError.unknown
        }
    }
    static func parseInput(input:String) throws -> [ANSICode.MyPoint]{
        guard !input.isEmpty else{
            throw StaticData.InputError.empty
        }
        let parsed = input.components(separatedBy: "-")
        var points = [ANSICode.MyPoint]()
        for item in parsed {
            let nums = (item.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: CharacterSet.init(charactersIn: "()"))).components(separatedBy: ",")
            guard nums.count == 2 else {
                throw StaticData.InputError.not2D
            }
            if let x = Int(nums[0]), let y = Int(nums[1]) {
                if(x > 24 || x < 0 || y > 24 || y < 0){
                    throw StaticData.InputError.outRange
                }
                points.append(ANSICode.MyPoint(x: x, y: y))
            }else{
                throw StaticData.InputError.notInt
            }
        }
        return points;
    }
}

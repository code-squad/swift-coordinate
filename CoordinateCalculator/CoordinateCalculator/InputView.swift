//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct InputView{
    enum InputError : Error {
        case empty;
        case not2D;
        case notInt;
        case outRange;
    }
    static let ErrStrDict : [InputError : String] = [
        InputError.empty : "입 력 없 음",
        InputError.not2D : "2 차 원 좌 표 만",
        InputError.notInt : "정 수 만",
        InputError.outRange : "0 부 터 2 4 까 지"
    ];
    static func printErr(errType : InputError){
        var errString = "알 수 없는 에러 : \(errType)";
        if let errStr = ErrStrDict[errType]{
            errString = errStr
        }
        print(errString);
    }
    static func readInput()->String{
        print("좌 표 입 력 : x, y (입력한 좌표들 출력하려면 R)")
        let read = readLine();
        if let read = read {
            return read
        }else{
            return ""
        }
    }
    static func parseInput(input:String) throws -> [Int]{
        let parsed = input.components(separatedBy: ",");
        var arr = [Int]();
        for item in parsed {
            if let n = Int(item.trimmingCharacters(in: .whitespacesAndNewlines)) {
                arr.append(n)
            }else{
                throw InputError.notInt
            }
        }
        return arr;
    }
    
    static func checkInput(input:String) throws{
        if input.isEmpty {
            throw InputError.empty
        }
        return;
    }
    
    static func checkData(data: [Int]) throws{
        guard data.count == 2 else {
            throw InputError.not2D
        }
        let x = data[0]
        let y = data[1]
        
        if(x > 24 || x < 0 || y > 24 || y < 0){
            throw InputError.outRange
        }
        
    }
}

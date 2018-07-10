//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct InputView{
    enum InputType {
        case OK;
        case empty;
        case run;
        case not2D;
        case notInt;
        case outRange;
    }
    static let ErrStrDict : [InputType : String] = [
        InputType.empty : "입 력 없 음",
        InputType.not2D : "2 차 원 좌 표 만",
        InputType.notInt : "정 수 만",
        InputType.outRange : "0 부 터 2 4 까 지"
    ];
    static func readInput()->String?{
        print("좌 표 입 력 : x, y (입력한 좌표들 출력하려면 R)")
        return readLine();
    }
    static func parseInput(input:String) -> [String]{
        let parsed = input.components(separatedBy: ",");
        var arr = [String]();
        for item in parsed {
            arr.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        return arr;
    }
    
    static func checkInput(input:String) -> InputType{
        if (input.isEmpty) {
            return InputType.empty
        }else if (input.lowercased() == "r"){
            return InputType.run
        }
        return InputType.OK;
    }
    
    static func checkData(data: [String]) -> InputType{
        if data.count != 2 {
            return InputType.not2D;
        }
        let x = Int(data[0]);
        let y = Int(data[1]);
        
        if(x == nil || y == nil){
            return InputType.notInt;
        }else if(x! > 24 || x! < 0 || y! > 24 || y! < 0){
            return InputType.outRange;
        }
        return InputType.OK;
    }
}

//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct InputView {
    
    // 입력 가능한 문자열 패턴. ex. (3,5)- 형식 가능.
    private static let validInputPattern: String = "\\([0-9]+,[0-9]+\\)-?"
    
    // 사용자 입력 메뉴 출력. 사용자 입력값을 '(Int,Int)-' 패턴으로 잘라서 반환.
    static func askFor(message: String) throws -> String? {
        // 요구 메시지 출력.
        print("\(ANSICode.cursor.move(row: OutputView.endYOfPage, col: OutputView.startXOfCommands))\(ANSICode.eraseEndLine)\(ANSICode.none)\(message)", terminator: " ")
        // 요구 메시지가 nil 인 경우, isNil 에러 처리.
        guard let inputLine = readLine() else{ throw FigureFactory.CoordsError.isNil }
        // q 또는 quit 입력 시 종료.
        guard inputLine != "q" && inputLine != "quit" else { return nil }
        return inputLine
    }
    
    static func makeUserData(from inputLine: String) throws -> UserData{
        let stringsInCoordPattern: [String] = try makeIntoCoordPattern(from: inputLine)
        // 좌표패턴의 문자열에서 MyPoint 생성. (좌표범위 넘으면 에러처리도 함)
        let points: [MyPoint] = try generatePoints(from: stringsInCoordPattern)
        return UserData(inputData: points)
    }
    
    // 문자열을 좌표패턴 기준으로 나누어 문자열 배열로 반환.
    private static func makeIntoCoordPattern(from inputLine: String) throws -> [String] {
        // 문자열을 좌표 패턴으로 자름.
        let stringsInCoordPattern = inputLine.split(pattern: validInputPattern)
        // 입력 패턴이 유효하지 않으면 에러처리.
        guard stringsInCoordPattern.count > 0 else { throw FigureFactory.CoordsError.invalidInputPattern }
        return stringsInCoordPattern
    }
    
    // 좌표패턴의 문자열들에서 숫자만 추출하여 MyPoint 객체들 생성.
    private static func generatePoints(from stringsInCoordPattern: [String]) throws -> [MyPoint] {
        var resultPoints: [MyPoint] = []
        for stringLikeCoord in stringsInCoordPattern {
            // 숫자패턴인 문자열만 추출.
            let coordsInString = stringLikeCoord.split(pattern: "[0-9]+")
            // 문자열을 숫자타입으로 변환.
            let coords: [Int] = coordsInString.map { Int($0) ?? 0 }
            // 숫자타입을 MyPoint타입으로 변환.
            resultPoints.append(MyPoint(x: Int(coords[0]), y: Int(coords[1])))
        }
        return resultPoints
    }
    
}

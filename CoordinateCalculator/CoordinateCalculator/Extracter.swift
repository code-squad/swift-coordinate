//
//  extractter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 커터 구조체
struct Extracter {
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴
    static func extractLettersFrom(originLetters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLetters as NSString
        return regex.matches(in : originLetters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 문자열을 받아서 숫자부분만 문자배열로 리턴
    static func extractNumbersFrom(originLetters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forNumberCheck) else {
            return nil
        }
        return extractLettersFrom(originLetters: originLetters, regex: numberRegexForm)
    }
    
    /// 문자열을 받아서 좌표부분만 문자배열로 리턴
    static func extractPointFrom(originLetters : String) -> Array<String>?{
        guard let PointRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forPointCheck) else {
            return nil
        }
        return extractLettersFrom(originLetters: originLetters, regex: PointRegexForm)
    }
    
    /// 문자열을 받아서 라인부분만 문자배열로 리턴
    static func extractLineFrom(originLetters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forLineCheck) else {
            return nil
        }
        return extractLettersFrom(originLetters: originLetters, regex: lineRegexForm)
    }
    
    /// 문자열을 받아서 삼각형부분만 문자배열로 리턴
    static func extractTriangleFrom(originLetters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forTriangle) else {
            return nil
        }
        return extractLettersFrom(originLetters: originLetters, regex: lineRegexForm)
    }
    
    /// 문자열을 받아서 사각형부분만 문자배열로 리턴
    static func extractRectangleFrom(originLetters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forRectangle) else {
            return nil
        }
        return extractLettersFrom(originLetters: originLetters, regex: lineRegexForm)
    }
    
    /// 숫자로만 이루어진 문자열 배열을 받아서 정수형배열로 리턴
    static func changeNumbersFrom(letters:Array<String>)->Array<Int>?{
        var numbers = Array<Int>()
        for letter in letters {
            guard let number = Int(letter) else {
                return nil
            }
            numbers.append(number)
        }
        return numbers
    }
    
    /// 마이포인트 배열을 받아서 x 좌표값을 모아서 배열로 리턴
    static func extractXPointsFrom(points:[MyPoint])->[Int]{
        // x,y 좌표를 받을 배열 선언
        var xPoints = [Int]()
        
        // 입력받은 마이포인트에서 좌표를 뽑아낸다
        for point in points {
            xPoints.append(point.getXAxis())
        }
        return xPoints
    }
    
    /// 마이포인트 배열을 받아서 x 좌표값을 모아서 배열로 리턴
    static func extractYPointsFrom(points:[MyPoint])->[Int]{
        // x,y 좌표를 받을 배열 선언
        var yPoints = [Int]()
        
        // 입력받은 마이포인트에서 좌표를 뽑아낸다
        for point in points {
            yPoints.append(point.getYAxis())
        }
        return yPoints
    }
    
    /// 마이포인트 배열을 받아서 x 좌표의 최대값을 리턴
    static func extractMaxXPoint(_ points:[MyPoint])->Int{
        // x,y 좌표를 받을 배열 선언
        let xPoints = Extracter.extractXPointsFrom(points: points)
        // 최대 값을 리턴
        return xPoints.max()!
    }
    
    /// 마이포인트 배열을 받아서 y 좌표의 최대값을 리턴
    static func extractMaxYPoint(_ points:[MyPoint])->Int{
        // x,y 좌표를 받을 배열 선언
        let yPoints = Extracter.extractYPointsFrom(points: points)
        // 최대 값을 리턴
        return yPoints.max()!
    }
    
    /// 마이포인트 배열을 받아서 x 좌표의 최소값을 리턴
    static func extractMinXPoint(_ points:[MyPoint])->Int{
        // x,y 좌표를 받을 배열 선언
        let xPoints = Extracter.extractXPointsFrom(points: points)
        // 최대 값을 리턴
        return xPoints.min()!
    }
    
    /// 마이포인트 배열을 받아서 y 좌표의 최소값을 리턴
    static func extractMinYPoint(_ points:[MyPoint])->Int{
        // x,y 좌표를 받을 배열 선언
        let yPoints = Extracter.extractXPointsFrom(points: points)
        // 최대 값을 리턴
        return yPoints.min()!
    }
    
    /// 마이포인트 배열을 받아서 가로세로를 구해서 Int CGSize 로 리턴
    static func extractCGSize(_ points:[MyPoint])->CGSize{
        // 최대 최소 값을 구한다.
        let maxXPoint = Extracter.extractMaxXPoint(points)
        let maxYPoint = Extracter.extractMaxYPoint(points)
        let minXPoint = Extracter.extractMinXPoint(points)
        let minYPoint = Extracter.extractMinYPoint(points)
        
        // 최대값에서 최소값을 빼서 가로 세로 를 구한다
        return CGSize(width: maxXPoint-minXPoint, height: maxYPoint-minYPoint)
    }
    
    /// 마이포인트 배열을 받아서 기준점을 리턴
    static func extractOriginPoint(_ points:[MyPoint])->MyPoint{
        // 최대Y 최소X 값을 구한다.
        let maxYPoint = Extracter.extractMaxYPoint(points)
        let minXPoint = Extracter.extractMinXPoint(points)
        
        // 기준점은 왼쪽 위 이니 마이포인트로 리턴한다
        return MyPoint(x: minXPoint, y: maxYPoint)
    }
}

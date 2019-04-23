import Foundation

struct InputControl {
    
    //MARK: 비공개 정적 메소드
    private static func point(input: String) throws -> Point {
        var inputCoordinate = input
        
        
        
        guard inputCoordinate.removeFirst() == "(", inputCoordinate.removeLast() == ")" else {
            throw InputError.cannotRecognizeParentheses
        }
        
        let coordinateValues = inputCoordinate.split(separator: ",").map { String($0) }
        
        guard coordinateValues.count == 2 else {
            throw InputError.cannotIdentifyTwoValues
        }
        
        let coordinate = try coordinateValues.map( { (value: String) -> Int in
            guard let coordinate = Int(value) else {
                throw InputError.cannotIdentifyNumbers
            }
            return coordinate
        } )
        
        return Point(x: coordinate[0], y: coordinate[1])
    }
    
    //MARK: 정적 메소드
    /// 문자열을 점 배열로 변환합니다.
    static func points(value: String) throws -> [Point] {
        
        guard value.count >= 5 else {
            throw InputError.notEnoughCharacter
        }
        
        let values = value.split(separator: "-").map { String($0) }
        var points: [Point] = []
        
        for value in values {
            let point = try InputControl.point(input: value)
            points.append(point)
        }
        return points
    }
    
}

enum InputError: Error, CustomStringConvertible {
    
    case invalidInput
    case cannotRecognizeParentheses
    case cannotIdentifyTwoValues
    case cannotIdentifyNumbers
    case exceededAxisLimit
    case notEnoughCharacter
    
    var description: String {
        switch self {
        case .invalidInput:
            return "유효하지 않은 입력"
        case .cannotIdentifyNumbers:
            return "숫자를 확인할 수 없음"
        case .cannotIdentifyTwoValues:
            return "두 개의 숫자를 확인할 수 없음"
        case .cannotRecognizeParentheses:
            return "괄호를 인식할 수 없음"
        case .exceededAxisLimit:
            return "좌표의 제한을 초과함"
        case .notEnoughCharacter:
            return "글자 수가 충분하지 않음"
        }
    }
    
}

import Foundation

enum InputError: Error {
    case invalidInput
    case cannotRecognizeParentheses
    case cannotIdentifyTwoValues
    case cannotIdentifyNumbers
    case notEnoughCharacters
    case exceededAxisLimit
    
    func description() -> String {
        var errorMessage = "입력 오류: "
        switch self {
        case .invalidInput:
            errorMessage += "유효하지 않은 입력"
        case .cannotIdentifyNumbers:
            errorMessage += "숫자를 확인할 수 없음"
        case .cannotIdentifyTwoValues:
            errorMessage += "두 개의 숫자를 확인할 수 없음"
        case .cannotRecognizeParentheses:
            errorMessage += "괄호를 인식할 수 없음"
        case .exceededAxisLimit:
            errorMessage += "좌표의 제한을 초과함"
        case .notEnoughCharacters:
            errorMessage += "글자 수가 충분하지 않음"
        }
        return errorMessage
    }
    
}


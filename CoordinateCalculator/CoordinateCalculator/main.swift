import Foundation

func main() throws {
    OutputView.drawAxis()
    let coordinate = try InputView.readCoordinate()
    OutputView.drawPoint(x: coordinate.x, y: coordinate.y)
    
}

do {
    try main()
} catch InputError.cannotIdentifyNumbers {
    print("오류: 숫자를 식별할 수 없음")
} catch InputError.cannotIdentifyTwoValues {
    print("오류: 두개의 숫자를 찾을 수 없음")
} catch InputError.cannotRecognizeParentheses {
    print("오류: 괄호를 찾을 수 없음")
} catch InputError.invalidInput {
    print("오류: 유효하지 않은 입력")
} catch InputError.notEnoughCharacters {
    print("오류: 글자 수가 충분하지 않음")
}

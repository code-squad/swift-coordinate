import Foundation

extension String {
    /// String이 Character를 몇개 가지고 있는지 확인합니다.
    func count(of selectedCharacter: Character) -> Int {
        var characterCount = 0
        for character in self {
            if selectedCharacter == character {
                characterCount += 1
            }
        }
        return characterCount
    }
}

struct InputView {
    
    //MARK: 비공개 정적 메소드
    private static func ask(about question: String) throws -> String {
        print(ANSICode.text.yellow + question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        return input
    }
    
    private static func recognizeCoordinateFormat(input: String) throws -> (x: Int, y: Int) {
        var userInput = input
        guard input.count >= 2 else {
            throw InputError.notEnoughCharacters
        }
        guard (userInput.removeFirst(), userInput.removeLast()) == ("(", ")") else {
            throw InputError.cannotRecognizeParentheses
        }
        let separator: Character = ","
        guard userInput.count(of: separator) == 1 else {
            throw InputError.cannotIdentifyTwoValues
        }
        let separatedValues = userInput.split(separator: separator).map { Int($0) }
        
        if separatedValues.contains(nil) {
            throw InputError.cannotIdentifyNumbers
        }
        return (separatedValues[0]!, separatedValues[1]!)
    }
    
    
    
    //MARK: 정적 메소드
    static func readCoordinate() throws -> Coordinate {
        let input = try ask(about: "좌표를 입력하세요.")
        let coordinateValue = try recognizeCoordinateFormat(input: input)
        guard let coordinate = Coordinate(x: coordinateValue.x, y: coordinateValue.y) else {
            throw InputError.exceededAxisLimit
        }
        return coordinate
    }
    
    
}

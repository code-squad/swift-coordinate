import Foundation

extension String {
    func count(of letter: Character) -> Int {
        var characterCount = 0
        for character in self {
            if letter == character {
                characterCount += 1
            }
        }
        return characterCount
    }
}

struct InputView {
    
    private static func readInput() throws -> String {
        guard let input = readLine(), input != "" else {
            throw InputError.invalidInput
        }
        return input
    }
    
    
    
    
    private static func recognizeCoordinateFormat(input: String) throws -> (x: Int, y: Int) {
        var userInput = input
        let separator: Character = ","
        guard (userInput.removeFirst(), userInput.removeLast()) == ("(", ")") else {
            throw InputError.cannotRecognizeParentheses
        }
        guard userInput.count(of: separator) == 1 else {
            throw InputError.cannotIdentifyTwoValues
        }
        let separatedValues = userInput.split(separator: separator).map { Int($0) }
        
        guard separatedValues.contains(nil) else {
            throw InputError.cannotIdentifyNumbers
        }
        
        return (separatedValues[0]!, separatedValues[1]!)
    }
    
    
    
    
}

import Foundation

enum InputError: Error {
    case invalidInput
    case invalidCoordinateFormat
    case invalidCoordinate
}

struct InputView {
    
    private static func readInput() throws -> String {
        guard let input = readLine(), input != "" else {
            throw InputError.invalidInput
        }
        return input
    }
    
    private static func confirmCoordinateFormat(input: String) throws -> (x: Int, y: Int) {
        var userInput = input
        guard userInput.contains(",") (userInput.removeFirst(), userInput.removeLast()) == ("(", ")") else {
            throw InputError.invalidCoordinateFormat
        }
        
        var coordinate = userInput.split(separator: ",").map { Int($0) }
        
        
        return (1, 1)
    }
    
    
    
    
}

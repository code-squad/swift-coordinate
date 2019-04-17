import Foundation

enum InputError: Error {
    case invalidInput
    case cannotRecognizeParentheses
    case cannotIdentifyTwoValues
    case cannotIdentifyNumbers
    case notEnoughCharacters
}

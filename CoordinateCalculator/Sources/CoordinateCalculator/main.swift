import Foundation

var inputView = InputView()

while(true) {
    do {
        guard let figure = try inputView.readInput() else { break }
        switch figure {
        case .point : OutputView.printPoint(inputView.point)
        case .line : OutputView.printLine(inputView.line)
        case .triangle: OutputView.printTriangle(inputView.triangle)
        }
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표 값은 24 이하로 입력해 주세요.")
    } catch InputError.outOfCoordinate {
        print("좌표의 개수는 3개 이하로 입력해 주세요.")
    }
}

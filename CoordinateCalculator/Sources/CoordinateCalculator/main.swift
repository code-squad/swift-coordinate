let outputView = OutputView()
let inputView = InputView()

while(true) {
    do {
        guard let input = try inputView.readInput() else { break }
        outputView.removeText()
        outputView.printPoint(point: input)
        outputView.drawAxis()
        outputView.removeText()
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표를 24 이하로 입력해 주세요.")
    }
}


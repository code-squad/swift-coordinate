
while(true) {
    do {
        guard let input = try InputView.readInput() else { break }
        OutputView.removeText()
        OutputView.printPoint(point: input)
        OutputView.drawAxis()
        OutputView.removeText()
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표를 24 이하로 입력해 주세요.")
    }
}


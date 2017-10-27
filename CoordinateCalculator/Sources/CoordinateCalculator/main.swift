import Foundation

var inputView = InputView()
var figureStore = FigureStore()

while(true) {
    do {
        guard let points = try inputView.readInput() else { break }
        let figure = try figureStore.convertArrayToFigure(points)
    } catch InputError.emptyInput {
        print("입력 값이 없습니다.")
    } catch InputError.invalidInput {
        print("입력 값이 유효하지 않습니다.")
    } catch InputError.outOfNumber {
        print("좌표 값은 24 이하로 입력해 주세요.")
    } catch InputError.outOfCoordinate {
        print("좌표의 개수는 4개 이하로 입력해 주세요.")
    } catch InputError.cannotMakeRect {
        print("직 사각형 좌표만 입력 가능 합니다.")
    }  catch InputError.cannotMakeTriangle {
        print("삼각형 좌표만 입력 가능 합니다.")
    }
}

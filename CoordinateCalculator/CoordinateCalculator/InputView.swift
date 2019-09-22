//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 공명진 on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Cocoa

struct InputView {

    static func readPoint() -> Point {
        var point: Point = (0, 0)

        while (point == (0, 0)) {
            do {
                print("좌표를 입력하세요.")
                point = try PointChecker().checkPoint(formular: readLine() ?? "")
            } catch PointCheckerError.invalidFormat {
                print("입력값에 잘못된 문자가 있습니다.")
            } catch PointCheckerError.invalidRange {
                print("좌표값은 1에서 24까지 가능합니다.")
            } catch PointCheckerError.wrongPointCount {
                print("잘못 된 좌표를 입력했습니다.")
            } catch {
                print("알수없는 오류가 발생했습니다.")
            }
        }
        return point
    }
}

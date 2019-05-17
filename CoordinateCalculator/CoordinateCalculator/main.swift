//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    while(true) {
        do {
            let coordinates = try InputView.readCoordinates()
            let coordinateConverter = ShapeConverter(parser: CoordinateParser(),
                                                          validator: CoordinateChecker())
            let shape = try coordinateConverter.makeShape(from: coordinates)
            OutputView.draw(shape)
            break
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            continue
        } catch let error as ShapeConverter.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("\(Message.unexpectedError(error: error))")
            continue
        }
    }
}

run()

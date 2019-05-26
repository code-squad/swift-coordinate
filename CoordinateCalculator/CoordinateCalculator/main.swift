//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    repeat {
        let coordinates: [String]
        let shape: Shape
        do {
            coordinates = try InputView.readCoordinates()
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("\(Message.unexpectedError.description): \(error)")
            continue
        }
        do {
            let shapeConverter = ShapeConverter(numberParser: NumberParser(),
                                                validator: CoordinateChecker())
            shape = try shapeConverter.makeShape(coordinates: coordinates)
            OutputView.draw(shape)
            break
        } catch let error as ShapeConverter.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("\(Message.unexpectedError.description): \(error)")
            continue
        }
    } while(true)
}

run()

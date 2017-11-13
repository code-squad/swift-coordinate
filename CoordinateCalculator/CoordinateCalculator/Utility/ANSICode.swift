//
//  ANSICode.swift
//  HelloSwift
//
//  Created by JK on 07/08/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

//https://en.wikipedia.org/wiki/ANSI_escape_code
public struct ANSICode {
    static let escape   = "\u{001B}["
    static let clear    = "\(escape)2J"
    static let home     = "\(escape)0;0H"
    static let none     = "\(escape)0;0m\(escape)1;0m"
    
    struct text {
        static let black   = escape + "0;30m"
        static let red     = escape + "0;31m"
        static let green   = escape + "0;32m"
        static let yellow  = escape + "0;33m"
        static let blue    = escape + "0;34m"
        static let magenta = escape + "0;35m"
        static let cyan    = escape + "0;36m"
        static let white   = escape + "0;37m"
        static let normal  = escape + "0;39m"
        static let blackBright   = escape + "1;30m"
        static let redBright     = escape + "1;31m"
        static let greenBright   = escape + "1;32m"
        static let yellowBright  = escape + "1;33m"
        static let blueBright    = escape + "1;34m"
        static let magentaBright = escape + "1;35m"
        static let cyanBright    = escape + "1;36m"
        static let whiteBright   = escape + "1;37m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)38;2;\(R);\(G);\(B)m"
        }
    }
    
    struct bgText {
        static let red     = escape + "0;41m"
        static let green   = escape + "0;42m"
        static let yellow  = escape + "0;43m"
        static let blue    = escape + "0;44m"
        static let magenta = escape + "0;45m"
        static let cyan    = escape + "0;46m"
        static let white   = escape + "0;47m"
        static let normal  = escape + "0;49m"
        static let redBright     = escape + "1;41m"
        static let greenBright   = escape + "1;42m"
        static let yellowBright  = escape + "1;43m"
        static let blueBright    = escape + "1;44m"
        static let magentaBright = escape + "1;45m"
        static let cyanBright    = escape + "1;46m"
        static let whiteBright   = escape + "1;47m"
        static func colorFrom(R:Int, G:Int, B:Int) -> String {
            return "\(escape)48;2;\(R);\(G);\(B)m"
        }
    }
    
    struct cursor {
        static func move(row : Int, col : Int) -> String {
            return "\(escape)\(row);\(col)f"
        }
    }
    
    struct axis {
        static let AxisLimit = 24
        private static func drawX() -> String {
            var result = ""
            for xLoop in 1...AxisLimit {
                    result += cursor.move(row: AxisLimit+1, col: xLoop*2+2)
                    result += "━━"
            }
            for xLoop in 1...(AxisLimit/2) {
                result += cursor.move(row: AxisLimit+2, col: xLoop*4+1)
                result += String.init(format: "%3d", xLoop*2)
            }
            return result
        }

        private static func drawY() -> String {
            var result = ""
            for yLoop in 1...AxisLimit {
                result += cursor.move(row: yLoop, col: 1)
                if yLoop % 2 == 1 {
                    result += String.init(format: "%2d|", AxisLimit-yLoop+1)
                }
                else {
                    result += "  |"
                }
            }
            result += cursor.move(row: AxisLimit+1, col: 3)
            result += "+"
            result += cursor.move(row: AxisLimit+2, col: 2)
            result += "0"
            return result
        }
        
        static func draw() -> String {
            let result = drawX() + drawY()
            return result
        }
}
    
    struct rect {
        static func draw(origin : (x:Int,y:Int), size : (width:Int,height:Int), isFill : Bool) -> String {
            var result = ""
            for yLoop in origin.y...(origin.y+size.height) {
                for xLoop in origin.x...(origin.x+size.width) {
                    result += cursor.move(row: yLoop, col: xLoop)
                    switch (xLoop,yLoop) {
                    case (origin.x, origin.y):
                        result += "┏"
                    case (origin.x+size.width,origin.y+size.height):
                        result += "┛"
                    case (origin.x, origin.y+size.height):
                        result += "┗"
                    case (origin.x+size.width,origin.y):
                        result += "┓"
                    case (origin.x, _):
                        fallthrough
                    case (origin.x+size.width, _):
                        result += "┃"
                    case (_, origin.y):
                        fallthrough
                    case (_, origin.y+size.height):
                        result += "━"
                    default:
                        if (isFill) { result += " " }
                        break
                    }
                }
            }
            return result
        }
    }
}

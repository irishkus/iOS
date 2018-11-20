//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let cathetus1:Int = 4
let cathetus2:Int = 3

var hypotenuse:Double = sqrt(Double(cathetus1)*Double(cathetus1)+Double(cathetus2)*Double(cathetus2))
var perimeter:Double = Double(cathetus2)+Double(cathetus1)+hypotenuse
var square:Double = (Double(cathetus2)*Double(cathetus1))/2

print("Гипотенуза равна " + String(hypotenuse))
print("Периметр равен " + String(perimeter))
print("Площадь равна " + String(square))



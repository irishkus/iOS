//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let a:Int = -2
let b:Int = 3
let c:Int = 2

var d:Int = 0
var x1:Double = 0
var x2:Double = 0

d = b*b-4*a*c

if (d<0) {
    print("У уравнения нет корней!")
} else if (d==0) {
    x1 = -Double(b)/(2*Double(a))
    print("У уравнения один корень и он равен " + String(x1))
} else {
    x1 = (-Double(b)-sqrt(Double(d)))/(2*Double(a))
    x2 = (-Double(b)+sqrt(Double(d)))/(2*Double(a))
    print("У уравнения два корня, первый равен " + String(x1) + ". Второй равен " + String(x2))
}



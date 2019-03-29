//: [Previous](@previous)

import Foundation

var sum: Double = 2_000_000
var percent: Double = 7.6
var i:Int=1

while i<=5 {
    sum = sum + (sum*percent)/100
//  print("Через " + String(i) + " лет сумма будет: " + String(sum))
    i+=1
}
print("Через 5 лет сумма будет: " + String(sum))


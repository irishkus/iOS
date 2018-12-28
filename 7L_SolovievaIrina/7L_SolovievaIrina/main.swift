//
//  main.swift
//  7L_SolovievaIrina.playground
//
//  Created by Ирина on 12.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation

enum RectangleError: Error {
    case sideNegative
    case sideZero
}

enum CircleError: Error {
    case radiusNegative
}

enum StackError: Error {            // ошибки очереди
    case deleteEmpty
}

class Rectangle {
    var sideA: Double
    var sideB: Double
    func calculatePerimiter() throws -> Double {
        guard (sideA > 0) && (sideB > 0) else {
            if (sideA == 0.0) || (sideB == 0.0) {
                 throw RectangleError.sideZero
            } else {
                throw RectangleError.sideNegative}
        }
        return sideA + sideB
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}

extension Rectangle : CustomStringConvertible {
    var description : String {
        return "[\(self.sideA), \(self.sideB)]"
    }
}

class Circle {
    var radius: Double
    func calculatePerimiter() -> (Double?, CircleError?) {
        guard radius >= 0 else {
            return (nil, CircleError.radiusNegative)
        }
        return (2.0 * Double.pi * radius, nil)
    }
    init(radius: Double) {
        self.radius = radius
    }
}

extension Circle : CustomStringConvertible {
    var description : String {
        return "[\(self.radius)]"
    }
}

struct Stack {                                   // коллекция типа стек
    private var elements: [Rectangle] = []      // массив, где мы будем хранить элементы
    mutating func push(_ element: Rectangle) { // добавляем элемент в конец массива
        elements.append(element)
    }
    mutating func pop() throws -> Rectangle {
        guard !elements.isEmpty else {
            throw StackError.deleteEmpty
        }
        return elements.removeLast()
    }
}
var stack = Stack()                          // создаем пустой стек
// добавляем элементы
stack.push(Rectangle(sideA: 10, sideB: 20))
stack.push(Rectangle(sideA: 2, sideB: 2))
print(stack)

do {
    let _ = try stack.pop()
} catch StackError.deleteEmpty {
    print ("Удаление  элемента из пустого стека")
}

print(stack)

do {
    let _ = try stack.pop()
} catch StackError.deleteEmpty {
    print ("Удаление  элемента из пустого стека")
}

print(stack)

do {
    let _ = try stack.pop()
} catch StackError.deleteEmpty {
    print ("Удаление  элемента из пустого стека")
}

let rec1 = Rectangle(sideA: -1, sideB: 20)

do {
    let _ = try rec1.calculatePerimiter()
} catch RectangleError.sideNegative {
    print ("Одна из сторон отрицательная")
} catch RectangleError.sideZero {
    print ("Одна из сторон равна нулю")
}

let rec2 = Rectangle(sideA: 0, sideB: 4)

do {
    let _ = try rec2.calculatePerimiter()
} catch RectangleError.sideNegative {
    print ("Одна из сторон отрицательная")
} catch RectangleError.sideZero {
    print ("Одна из сторон равна нулю")
}

let circle1 = Circle(radius: -4)
if let perimetr = circle1.calculatePerimiter().0 {
    print("Перимет равен \(perimetr) ")
} else if let error = circle1.calculatePerimiter().1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}

print(circle1)

let circle2 = Circle(radius: 4)
if let perimetr = circle2.calculatePerimiter().0 {
    print("Перимет равен \(perimetr) ")
} else if let error = circle2.calculatePerimiter().1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}

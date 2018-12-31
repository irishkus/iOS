//
//  main.swift
//  6L_SolovievaIrina
//
//  Created by Ирина on 07.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation

protocol Perimeter {
    func calculatePerimiter() -> Double
}

class Circle: Perimeter {
    var radius: Double
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Rectangle: Perimeter {
    var sideA: Double
    var sideB: Double
    func calculatePerimiter() -> Double {
        return 2 * (sideA + sideB)
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

//замыкание определяющее максимальную величину
let maxValue: (Perimeter, _: Double) -> Bool = { (element: Perimeter, max: Double) -> Bool in
    return element.calculatePerimiter() > max
}

//замыкание определяющее минимальную величину
let minValue: (Perimeter, _: Double) -> Bool = { (element: Perimeter, min: Double) -> Bool in
    return element.calculatePerimiter() < min
}

struct Queue<T: Perimeter> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeFirst()
    }

    //метод высшего порядка определяющий максимальный/минимальный из всех периметров класса Т
    func minMaxPerimetr (predicate: (T, Double) -> Bool) -> Double {
        var value : Double = elements[0].calculatePerimiter()
        for element in elements {
            if predicate(element, value) {
                value = element.calculatePerimiter()
            }
        }
        return value
    }
    
    //метод высшего порядка трансформирующий дженерик Т в дженерик R
    func  transform <R> (transformation: (T) -> R ) -> [R] {
        var elementR: [R] = []
        for element in elements {
            elementR.append(transformation(element))
        }
        return elementR
    }
    
     //метод высшего порядка сортирующий T по возрастанию
    mutating func sortingIncrease(predicate: (T, Double) -> Bool) -> [T] {
        var tmpArray: [T] = []
        while (elements.count>0) {
            let value: Double = minMaxPerimetr(predicate: minValue)
            for element in 0...elements.count-1 {
                if elements[element].calculatePerimiter() == value {
                    tmpArray.append(elements[element])
                    elements.remove(at: element)
                    break
                }
            }
        }
        elements = tmpArray
        return elements                     // возвращаем отфильтрованный массив
    }
    
    //метод высшего порядка сортирующий T по убыванию
    mutating func sortingDecrease(predicate: (T, Double) -> Bool) -> [T] {
        var tmpArray: [T] = []
        while (elements.count>0) {
            let value: Double = minMaxPerimetr(predicate: maxValue)
            for element in 0...elements.count-1 {
                if elements[element].calculatePerimiter() == value {
                    tmpArray.append(elements[element])
                    elements.remove(at: element)
                    break
                }
            }
        }
        elements = tmpArray
        return elements                     // возвращаем отфильтрованный массив
    }
    
    //subscript, который возвращает nil в случае обращения к несуществующему индексу.
    subscript(elements: Int ...) -> Double? {
        var sumPerimeter = 0.0
        for index in elements {
            if index < self.elements.count {
            sumPerimeter += self.elements[index].calculatePerimiter()
            } else {
                return nil
            }
        }
        return sumPerimeter
    }
}

extension Circle : CustomStringConvertible {
    var description : String {
        return "[R = \(self.radius)]"
    }
}

//перечисление, которое переводит периметры в строки
let perimeterToString: (Perimeter) -> String = { (element: Perimeter) -> String in
    return "Perimeter  \(element.calculatePerimiter())"
}

//перечисление, которое возвращает периметр элемента
let perimeterValue : (Perimeter) -> Double = {(element: Perimeter) -> Double in
    return element.calculatePerimiter()
}

var queueRectangle = Queue<Rectangle>()
var queueCircle = Queue<Circle>()

queueRectangle.push(Rectangle(sideA: 10, sideB: 20))
queueRectangle.push(Rectangle(sideA: 2, sideB: 2))
queueRectangle.push(Rectangle(sideA: 17, sideB: 90))
queueRectangle.push(Rectangle(sideA: 10, sideB: 3))

print(queueRectangle)
print("Выводим трансмормированный в String массив прямоугольников")
print(queueRectangle.transform (transformation: perimeterToString))
print("Выводим трансмормированный в Double массив прямоугольников")
print(queueRectangle.transform (transformation: perimeterValue))
print("Минимальный периметр из массива прямоугольников")
print(queueRectangle.minMaxPerimetr(predicate: minValue))
print("Отсортированный по возрастанию массив прямоугольников")
print(queueRectangle.sortingIncrease(predicate: minValue))
print("Отсортированный по убыванию массив прямоугольников")
print(queueRectangle.sortingDecrease(predicate: minValue))
print("Максимальный периметр из массива прямоугольников")
print(queueRectangle.minMaxPerimetr(predicate: maxValue))
print("Пытаемся посчитать сумму периметров с элементом выходящим за пределы массива")
print(queueRectangle[0, 4])
print("Считаем сумму периметров элементов массива")
print(queueRectangle[0, 1, 3])
queueRectangle.pop()
queueRectangle.pop()
print(queueRectangle)
queueCircle.push(Circle(radius: 5))
queueCircle.push(Circle(radius: 19))
queueCircle.push(Circle(radius: 7))
queueCircle.push(Circle(radius: 9))
queueCircle.push(Circle(radius: 12))
queueCircle.push(Circle(radius: 50))
print(queueCircle)
print("Выводим трансмормированный в String массив кругов")
print(queueCircle.transform (transformation: perimeterToString))
print("Выводим трансмормированный в Double массив кругов")
print(queueRectangle.transform (transformation: perimeterValue))
print("Минимальный периметр из массива кругов")
print(queueCircle.minMaxPerimetr(predicate: minValue))
print("Максимальный периметр из массива кругов")
print(queueCircle.minMaxPerimetr(predicate: maxValue))
print("Отсортированный по возрастанию массив кругов")
print(queueCircle.sortingIncrease(predicate: minValue))
print("Отсортированный по убыванию массив кругов")
print(queueCircle.sortingDecrease(predicate: minValue))
print("Пытаемся посчитать сумму периметров с элементом выходящим за пределы массива")
print(queueCircle[0, 4])
print("Считаем сумму периметров элементов массива")
print(queueCircle[0, 1, 3])
queueCircle.pop()
queueCircle.pop()
queueCircle.pop()
queueCircle.pop()
print(queueCircle)


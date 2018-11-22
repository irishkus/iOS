//
//  main.swift
//  2l_SolovievaIrina.playground
//
//  Created by Ирина on 21.11.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation

//функция, которая определяет, четное число или нет

func even (number: Int) -> Bool{
    let n:Int = number
    if (n % 2) == 0{
        return true
    } else {
        return false
    }
}

//проверяем работу функции

print(String(even (number: 3)))
print(String(even (number: 13)))
print(String(even (number: 11)))
print(String(even (number: 12)))
print(String(even (number: 4)))
print("=============")

//функция, которая определяет, делится ли число без остатка на 3

func division(number: Int) -> Bool{
    let n:Int = number
    if (n % 3) == 0{
        return true
    } else {
        return false
    }
}

//проверяем работу функции

print(String(division (number: 3)))
print(String(division (number: 13)))
print(String(division (number: 11)))
print(String(division (number: 12)))
print(String(division (number: 4)))
print("=============")

//Создаем возрастающий массив из 100 чисел

var newArray: Array<Int> = []
for i in (0...99) {
    newArray.append(i+1)
}

//Удаляем из массива все четные числа и все числа, которые не делятся на 3

var i:Int = 0
while i < newArray.count  {
    if even(number: newArray[i])||(!division (number: newArray[i])){
        newArray.remove(at: i)
    }else {i+=1}
}

//выводим массив после удаления

print(newArray)
print("=============")

// функция, которая добавляет в массив новое число Фибоначчи

func fibonacci (array: inout [Double]) {
    if (array.count>=2){
        let i = array.count
        let n: Double = array[i-1] + array[i-2]
        array.append(n)
    }else {
        print ("Недостаточно элементов в массиве")
    }
}

//создаем массив и добавляем при помощи функции Фибоначчи 100 элементов в массив.

var fibonaciArray: Array = [0.0,1.0]
for _ in (1...100){
    fibonacci(array: &fibonaciArray)
}

//выводим массив с числами Фибоначчи

print(fibonaciArray)
print("=============")

//Заполняем массив из 100 элементов различными простыми числами.
//для этого выписываем подряд все целые числа от двух до n

var simpleNumberArray = [Int]()
var p: Int = 2 //переменная p изначально равна двум – первому простому числу.
var n:Int = 1000
for i in (2...(n)){
    simpleNumberArray.append(i)
}

//Функция, которая зачеркивает (заменяет на 0) в списке числа от 2p до n, считая шагами по p
func crossOut (array: inout [Int], p: Int, n: inout Int){
    for a in stride(from: 2*p-2, to: n-1, by: p){
        array[a] = 0
    }
}

//повторяем шаги с зачеркиванием не простых чисел и увеличением р
while p < n/2 {
    crossOut(array: &simpleNumberArray, p: p, n: &n)
    i = 0
    while i<simpleNumberArray.count{
        if simpleNumberArray[i] > p {
            p = simpleNumberArray[i] //Находим первое не зачеркнутое число в списке, большее, чем p, и присваиваем значению переменной p это число
            break
        }else {i+=1}
    }
}
i = 0
//оставляем массив из 100 простых чисел
while i<simpleNumberArray.count{
    if (simpleNumberArray[i] == 0)||(i>=100) {
        simpleNumberArray.remove(at: i)
    } else {i+=1}
}

//выводим массив с простыми числами из 100 элементов
print(simpleNumberArray)

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


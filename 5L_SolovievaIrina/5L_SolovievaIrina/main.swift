//
//  main.swift
//  5L_SolovievaIrina
//
//  Created by Ирина on 03.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation

// перечисление открыть/закрыть окна
enum WindowsState {
    case open, close
}
//перечисление запустить/заглушить двигатель
enum EngineState {
    case run, kill
}
//перечисление направление движения
enum Direction {
    case left, right, forward, turn
}

protocol Car {
    var model: String {get}
    var color: CGColor {get set}
    var maxSpeed: Int {get}
    var wheelCount: Int {get}
    func move (direction: Direction)
}

//расширяем протокол Car
extension Car {
    func windows (windowsState: WindowsState) {
        switch windowsState {
        case .open:
            print ("Окна открыты")
        case .close:
            print ("Окна закрыты")
        }
    }
    
    func engine (engineState: EngineState) {
        switch engineState {
        case .run:
            print ("Двигатель завели")
        case .kill:
            print ("Двигатель заглушили")
        }
    }
}

//создаем класс имплементирующий протокол Car
class trunkCar: Car {
    var model: String {
        return "Vagon"
    }
    
    var color: CGColor = .white
    
    var maxSpeed: Int {
        return 80
    }
    
    var wheelCount: Int {
        return 8
    }
    
    func move(direction: Direction) {
        switch direction {
        case .left:
            print ("Поворачиваем налево")
        case .right:
            print ("Поворачиваем направо")
        case .turn:
            print ("Разворачиваемся")
        case .forward:
            print ("Едем вперед")
        }
    }
    
    //добавляем свойство объем цистерны
    var volume: Double
    init(volume: Double) {
        self.volume = volume
         //   print("Объем цистерны у \(model) равен \(volume) ")
    }

}

//создаем класс имплементирующий протокол Car
class sportCar: Car {
    var model: String {
        return "Porsche"
    }
    
    var color: CGColor = .black
    
    var maxSpeed: Int {
        return 400
    }
    
    var wheelCount: Int {
        return 4
    }
    
    func move(direction: Direction) {
        switch direction {
        case .left:
            print ("Поворачиваем налево")
        case .right:
            print ("Поворачиваем направо")
        case .turn:
            print ("Разворачиваемся")
        case .forward:
            print ("Едем вперед")
        }
    }
    
    //добавляем свойство спойлер
    var spoiler: Bool
    init(spoiler: Bool) {
        self.spoiler = spoiler
    }
}

//расширение, имплементирующее протокол «CustomStringConvertible» для класса trunkCar
extension trunkCar: CustomStringConvertible {
    var description: String{
        return "Цистерна модели \(model), с максимальной скоростью \(maxSpeed), с \(wheelCount) колесами и с объемом цистерны \(volume)"
    }
}

//расширение, имплементирующее протокол «CustomStringConvertible» для класса sportCar
extension sportCar: CustomStringConvertible {
    var description: String{
        if spoiler == true {
            return "Спорткар модели \(model) со спойлером, с максимальной скоростью \(maxSpeed) и с \(wheelCount) колесами"
        } else {return "Спорткар модели \(model) без спойлера, с максимальной скоростью \(maxSpeed) и с \(wheelCount) колесами"}
        
    }
}

//создаем объекты классов и применяем к ним действия, выводим объекты в консоль
var car1 = trunkCar (volume: 200)
car1.color = .black
car1.volume = 180
print (car1)
car1.move(direction: .turn)

var car2 = sportCar (spoiler: true)
print(car2)
car2.move(direction: .right)
car2.move(direction: .forward)
car2.move(direction: .left)
car2.move(direction: .forward)
car2.move(direction: .right)

var car3 = sportCar (spoiler: false)
print(car3)
car3.move(direction: .forward)
car3.move(direction: .left)


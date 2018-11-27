//
//  main.swift
//  3L_SolovievaIrina.playground
//
//  Created by Ирина on 25.11.2018.
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
//перечисление моделей
enum Model {
    case geely, honda, renault, peugeot, mercedes, kamaz
}
//печисление изменение свойств
enum EditProperties {
    case openWindows
    case closeWindows
    case runEngine
    case killEngine
}
//структура легковой автомобиль
struct Car {
    let year: Int
    let model: Model
    let luggageCapacity: Double
    //отслеживаем загрузку/выгрузку груза из багажника
    var luggageCapacityBusy: Double {
        didSet {
            let cargo = luggageCapacityBusy - oldValue
            if cargo > 0 {
                print ("Загрузили в багажник груз объемом \(cargo)")
            } else if cargo < 0 {
                print ("Выгрузили из багажника груз объемом \(abs(cargo))")
            } else {print ("В багажнике все осталось как было")}
        }
    }
    //отслеживаем запуск/остановку двигателя
    var engineState: EngineState {
        willSet {
            if newValue == .run {
                print("Двигатель сейчас запустится")
            } else {
                print("Двигатель сейчас заглушится")
            }
        }
    }
    //отслеживаем открытие/закрытие окон
    var windowsState: WindowsState{
        willSet {
            if newValue == .open {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        
        }
    }
    //метод, который меняет свойства структуры в зависимости от действий
    mutating func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindows:
            self.windowsState = .open
        case .closeWindows:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        }
    }
    func printProperties() {
        print("Легковой автомобиль года выпуска \(year), марки \(model), c объемом багажника \(luggageCapacity) и занятым объемом \(luggageCapacityBusy), имеет двигатель в состоянии \(engineState) и окна в состоянии \(windowsState)")
    }
    
}
//структура грузовик
struct Truck {
    let year: Int
    let model: Model
    let bodyCapacity: Double
    //отслеживаем загрузку/выгрузку груза из кузова
    var bodyCapacityBusy: Double {
        didSet {
            let cargo = bodyCapacityBusy - oldValue
            if cargo > 0 {
                print ("Загрузили в кузов груз объемом \(cargo)")
            } else if cargo < 0 {
                print ("Выгрузили из кузова груз объемом \(abs(cargo))")
            } else {print ("В кузове все осталось как было")}
        }
    }
    //отслеживаем запуск/остановку двигателя
    var engineState: EngineState {
        willSet {
            if newValue == .run {
                print("Двигатель сейчас запустится")
            } else {
                print("Двигатель сейчас заглушится")
            }
        }
    }
    //отслеживаем открытие/закрытие окон
    var windowsState: WindowsState {
        willSet {
            if newValue == .open {
                print("Окна сейчас откроются")
            } else {
                print("Окна сейчас закроются")
            }
        }
    }

    //метод, который меняет свойства структуры в зависимости от действий
    mutating func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindows:
            self.windowsState = .open
        case .closeWindows:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        }
    }
    func printProperties() {
        print("Грузовик года выпуска \(year), марки \(model), c объемом кузова \(bodyCapacity) и занятым объемом \(bodyCapacityBusy), имеет двигатель в состоянии \(engineState) и окна в состоянии \(windowsState)")
    }
}

// инициализация нескольки экземпляров структур
var car1 = Car (year: 2013, model: .geely, luggageCapacity: 30.0, luggageCapacityBusy: 20.5, engineState: .run, windowsState: .close)

var car2 = Car (year: 2008, model: .renault, luggageCapacity: 35.0, luggageCapacityBusy: 5, engineState: .kill, windowsState: .open)

var truck1 = Truck (year: 2000, model: .mercedes, bodyCapacity: 350.0, bodyCapacityBusy: 50, engineState: .run, windowsState: .open)

//применяем различные действия к структурам
car1.engineState = .kill
car1.windowsState = .open
car1.luggageCapacityBusy = 20
car2.engineState = .run
truck1.windowsState = .close
truck1.bodyCapacityBusy = 63
truck1.engineState = .kill
car1.editPropirtiesStuct(edit: .runEngine)
truck1.editPropirtiesStuct(edit: .openWindows)
car2.luggageCapacityBusy = 10
truck1.bodyCapacityBusy = 85
//Выводим значения свойств экземпляров в консоль.
car1.printProperties()
car2.printProperties()
truck1.printProperties()

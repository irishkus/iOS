//
//  main.swift
//  4L_SolovievaIrina
//
//  Created by Ирина on 29.11.2018.
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
//перечисление поднять/опустить кузов
enum CarcassState {
    case up, down
}
//перечисление открыть/закрыть крышу кабриолета
enum RoofState {
    case open, close
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
    case upCarcass
    case downCarcass
    case openRoof
    case closeRoof
}
//структура легковой автомобиль
class Car {
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
    func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindows:
            self.windowsState = .open
        case .closeWindows:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        default:
            print("Свойство из другого класса")

        }
    }
    
    func printProperties() {
        print("Легковой автомобиль года выпуска \(year), марки \(model), c объемом багажника \(luggageCapacity) и занятым объемом \(luggageCapacityBusy), имеет двигатель в состоянии \(engineState) и окна в состоянии \(windowsState)")
    }
    //конструктор
    init(year: Int, model: Model, luggageCapacity: Double, luggageCapacityBusy: Double, engineState: EngineState, windowsState: WindowsState) {
        self.year = year
        self.model = model
        self.luggageCapacity = luggageCapacity
        self.luggageCapacityBusy = luggageCapacityBusy
        self.engineState = engineState
        self.windowsState = windowsState
    }
}

class SportCar: Car {
    var roofState: RoofState
    //конструктор
    init (year: Int, model: Model, luggageCapacity: Double, luggageCapacityBusy: Double, engineState: EngineState, windowsState: WindowsState, roofState: RoofState) {
        self.roofState = roofState
        super.init (year: year, model: model, luggageCapacity: luggageCapacity, luggageCapacityBusy: luggageCapacityBusy, engineState: engineState, windowsState: windowsState)
    }
    
        func openRoof() {
            self.roofState = .open
            print("Открыли крышу")
        }
    
        func closeRoof() {
            self.roofState = .close
            print("Закрыли крышу")
        }
    
    //переопределяем метод
    override func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindows:
            self.windowsState = .open
        case .closeWindows:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        case .openRoof:
            self.roofState = .open
        case .closeRoof:
            self.roofState = .close
        default:
            print("Свойство из другого класса")
    }
    }
}

class TrunckCar: Car {
    var carcassStatus: CarcassState
    //конструктор
    init (year: Int, model: Model, luggageCapacity: Double, luggageCapacityBusy: Double, engineState: EngineState, windowsState: WindowsState, carcassStatus: CarcassState) {
        self.carcassStatus = carcassStatus
        super.init (year: year, model: model, luggageCapacity: luggageCapacity, luggageCapacityBusy: luggageCapacityBusy, engineState: engineState, windowsState: windowsState)
    }
    
    func upCarcass() {
        self.carcassStatus = .up
        print("Поднимаем кузов")
    }
    
    func downCarcass() {
        self.carcassStatus = .down
        print("Опускаем кузов")
    }
    //переопределяем метод
    override func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindows:
            self.windowsState = .open
        case .closeWindows:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        case .upCarcass:
            self.carcassStatus = .up
        case .downCarcass:
            self.carcassStatus = .down
        default:
            print("Свойство из другого класса")
        }
    }
}
// создаем объекты каждого класса
var car1 = Car (year: 2013, model: .geely, luggageCapacity: 30.0, luggageCapacityBusy: 20.5, engineState: .run, windowsState: .close)

var car2 = Car (year: 2008, model: .renault, luggageCapacity: 35.0, luggageCapacityBusy: 5, engineState: .kill, windowsState: .open)

var car3 = TrunckCar (year: 2108, model: .kamaz, luggageCapacity: 350.0, luggageCapacityBusy: 50, engineState: .kill, windowsState: .open, carcassStatus: .down)

var car4 = SportCar (year: 2018, model: .renault, luggageCapacity: 10.0, luggageCapacityBusy: 5, engineState: .kill, windowsState: .open, roofState: .close)

//применяем различные действия к структурам
car1.engineState = .kill
car1.windowsState = .open
car1.luggageCapacityBusy = 20
car2.engineState = .run
car3.carcassStatus = .up
car3.downCarcass()
car3.upCarcass()
car1.editPropirtiesStuct(edit: .runEngine)
car2.luggageCapacityBusy = 10
//Выводим значения свойств экземпляров в консоль.
car1.printProperties()
car2.printProperties()
car4.openRoof()
car4.closeRoof()
car4.roofState = .open
car3.editPropirtiesStuct(edit: .downCarcass)
car4.editPropirtiesStuct(edit: .openRoof)
print("Кузов находится в положении \(car3.carcassStatus)")
print("Крыша находится в положении \(car4.roofState)")

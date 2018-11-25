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
//перечисление груза
//enum Сargo {
//    case load, unload
//}
enum Cargo {
    case load, unload, leave
}

enum EditProperties {
    case openWindow
    case closeWindow
    case runEngine
    case killEngine
    case loadCargo
    case unloadCargo
}
//структура легковой автомобиль
struct Car {
    let year: Int
    let model: Model
    let luggageCapacity: Double
    var luggageCapacityBusy: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var cargo: Cargo
    
    //метод открытия окон
    mutating func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindow:
            self.windowsState = .open
        case .closeWindow:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        case.loadCargo:
            self.cargo = .load
        case.unloadCargo:
            self.cargo = .unload
        
        }
    }
    
    
}
//структура грузовик

struct Truck {
    let year: Int
    let model: Model
    let bodyCapacity: Double
    var bodyCapacityBusy: Double
    var engineState: EngineState
    var windowsState: WindowsState
    var cargo: Cargo
    
    //метод открытия окон
    mutating func editPropirtiesStuct(edit: EditProperties) {
        switch edit {
        case .openWindow:
            self.windowsState = .open
        case .closeWindow:
            self.windowsState = .close
        case .runEngine:
            self.engineState = .run
        case .killEngine:
            self.engineState = .kill
        case.loadCargo:
            self.cargo = .load
        case.unloadCargo:
            self.cargo = .unload
            
        }
    }
}

var car1 = Car (year: 4, model: .geely, luggageCapacity: 30.0, luggageCapacityBusy: 20.5, engineState: .run, windowsState: .close, cargo: .leave)

var car2 = Car (year: 10, model: .renault, luggageCapacity: 35.0, luggageCapacityBusy: 5, engineState: .kill, windowsState: .open, cargo: .leave)

var truck1 = Truck (year: 1, model: .mercedes, bodyCapacity: 350.0, bodyCapacityBusy: 50, engineState: .run, windowsState: .open, cargo: .leave)

car1.engineState = .kill
car1.windowsState = .open
car2.cargo = .load
car2.engineState = .run
truck1.windowsState = .close
truck1.cargo = .unload
truck1.engineState = .kill









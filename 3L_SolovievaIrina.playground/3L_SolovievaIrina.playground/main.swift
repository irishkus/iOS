//
//  main.swift
//  3L_SolovievaIrina.playground
//
//  Created by Ирина on 25.11.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation
// перечисление открыть/закрыть окна
enum OpenWindows {
    case open, close
}
//перечисление запустить/заглушить двигатель
enum Engine {
    case run, kill
}
//перечисление моделей
enum Model {
    case geely, honda, renault, peugeot, mercedes, kamaz
}
//перечисление груза
//enum Сargo {
//    case load(kg:Double)
//    case unload(kg:Double)
//}
//структура легковой автомобиль
struct Car {
    let year: Int
    let model: Model
    let luggageCapacity: Double
    var luggageCapacityBusy: Double
    var engine: Engine
    var openWindows: OpenWindows
    
}
//структура грузовик

struct Truck {
    let year: Int
    let model: Model
    let bodyCapacity: Double
    var bodyCapacityBusy: Double
    var engine: Engine
    var openWindows: OpenWindows
}

let car1 = Car (year: 4, model: .geely, luggageCapacity: 30.0, luggageCapacityBusy: 20.5, engine: .run, openWindows: .close)

let car2 = Car (year: 10, model: .renault, luggageCapacity: 35.0, luggageCapacityBusy: 5, engine: .kill, openWindows: .open)

let truck1 = Truck (year: 1, model: .mercedes, bodyCapacity: 350.0, bodyCapacityBusy: 50, engine: .run, openWindows: .open)







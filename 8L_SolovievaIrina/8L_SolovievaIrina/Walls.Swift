//
//  Walls.Swift
//  8L_SolovievaIrina
//
//  Created by Ирина on 17.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
// Яблоко
class Walls: UIBezierPath {
    convenience init() {
        self.init()
let wallRight = UIBezierPath()
wallRight.move(to: CGPoint(x: view.scene!.frame.minX, y: view.scene!.frame.minY))
wallRight.addLine(to: CGPoint(x: view.scene!.frame.minX, y: view.scene!.frame.maxY))
let wallLeft = UIBezierPath()
wallLeft.move(to: CGPoint(x: view.scene!.frame.maxX, y:view.scene!.frame.minY))
wallLeft.addLine(to: CGPoint(x: view.scene!.frame.maxX, y: view.scene!.frame.maxY))
let wallBottom = UIBezierPath()
wallBottom.move(to: CGPoint(x: view.scene!.frame.minX, y:view.scene!.frame.minY))
wallBottom.addLine(to: CGPoint(x: view.scene!.frame.maxX, y: view.scene!.frame.minY))
let wallTop = UIBezierPath()
wallTop.move(to: CGPoint(x: view.scene!.frame.minX, y:view.scene!.frame.maxY))
wallTop.addLine(to: CGPoint(x: view.scene!.frame.maxX, y: view.scene!.frame.maxY))
}

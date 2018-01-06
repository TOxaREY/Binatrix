//
//  Effect.swift
//  Binatrix
//
//  Created by REYNIKOV ANTON on 16.10.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
class Effect: SKView {
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        if let uno = SKEmitterNode(fileNamed: "uno.sks") {
            uno.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            uno.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(uno)
        }
        if let zero = SKEmitterNode(fileNamed: "zero.sks") {
            zero.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            zero.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(zero)
        }
     }
  }



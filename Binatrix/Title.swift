//
//  Title.swift
//  Binatrix
//
//  Created by REYNIKOV ANTON on 16.10.2017.
//  Copyright © 2017 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
class Title: SKView {
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        if let b = SKEmitterNode(fileNamed: "b.sks") {
            b.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            b.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(b)
        }
        if let i = SKEmitterNode(fileNamed: "i.sks") {
            i.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            i.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(i)
        }

        if let n = SKEmitterNode(fileNamed: "n.sks") {
            n.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            n.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(n)
        }

        if let a = SKEmitterNode(fileNamed: "a.sks") {
            a.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            a.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(a)
        }

        if let r = SKEmitterNode(fileNamed: "r.sks") {
            r.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            r.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(r)
        }

        if let y = SKEmitterNode(fileNamed: "y.sks") {
            y.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            y.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(y)
        }
        if let n = SKEmitterNode(fileNamed: "n.sks") {
            n.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            n.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(n)
        }
        if let u = SKEmitterNode(fileNamed: "u.sks") {
            u.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            u.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(u)
        }
        
        if let m = SKEmitterNode(fileNamed: "m.sks") {
            m.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            m.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(m)
        }
        if let b = SKEmitterNode(fileNamed: "b.sks") {
            b.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            b.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(b)
        }
        if let e = SKEmitterNode(fileNamed: "e.sks") {
            e.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            e.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(e)
        }
        if let r = SKEmitterNode(fileNamed: "r.sks") {
            r.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height)
            r.particlePositionRange = CGVector(dx: self.bounds.size.width, dy: 0)
            scene.addChild(r)
        }

    }
}

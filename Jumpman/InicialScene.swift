//
//  GameScene.swift
//  Jumpman
//
//  Created by Matheus Alves on 31/05/16.
//  Copyright (c) 2016 Encosis 2016. All rights reserved.
//

import SpriteKit

class InicialScene: SKScene {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        if let scene = JogoScene(fileNamed:"JogoScene") {
            
            let trans = SKTransition.pushWithDirection(.Up, duration: 0.8)
            scene.scaleMode = .AspectFill
            self.view?.presentScene(scene, transition: trans)
            
        }
        
    }
   
}

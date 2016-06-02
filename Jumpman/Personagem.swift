//
//  Personagem.swift
//  Jumpman
//
//  Created by Matheus Alves on 01/06/16.
//  Copyright © 2016 Encosis 2016. All rights reserved.
//

import SpriteKit

class Personagem: SKSpriteNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.physicsBody?.categoryBitMask = Categorias.Personagem
        self.physicsBody?.contactTestBitMask = Categorias.Obstaculo
        self.physicsBody?.collisionBitMask = Categorias.Terra | Categorias.Personagem
        
    }
    
    
}

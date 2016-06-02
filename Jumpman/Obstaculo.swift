//
//  Obstaculo.swift
//  Jumpman
//
//  Created by Matheus Alves on 01/06/16.
//  Copyright © 2016 Encosis 2016. All rights reserved.
//

import SpriteKit

class Obstaculo: SKSpriteNode {

    var marcador = SKSpriteNode()
    var pontuado = false
    let tempo : NSTimeInterval = 7
    
    init(){
        super.init(texture: nil, color: UIColor.redColor(), size: CGSizeZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.marcador = self.childNodeWithName("Marcador") as! SKSpriteNode
        self.physicsBody?.categoryBitMask = Categorias.Obstaculo
        self.physicsBody?.contactTestBitMask = Categorias.Personagem
//        self.physicsBody?.collisionBitMask = Categorias.Personagem | Categorias.Obstaculo
        self.aplicarFisicaAoMarcador()
        
    }
    
    func aplicarFisicaAoMarcador(){
    
        self.marcador.physicsBody = SKPhysicsBody(rectangleOfSize: marcador.size)
        self.marcador.physicsBody?.affectedByGravity = false
        self.marcador.physicsBody?.allowsRotation = false
        self.marcador.physicsBody?.dynamic = false
        self.marcador.physicsBody?.categoryBitMask = Categorias.Marcador
        self.marcador.physicsBody?.contactTestBitMask = Categorias.Personagem
        self.marcador.physicsBody?.collisionBitMask = Categorias.Nenhum
        
    }
    
    
    func aplicarAndar( larguraDaTela : CGFloat ){
        
        let terminarNaPosicaoX = -larguraDaTela/2 - self.size.width
        
        let moverPara = SKAction.moveToX(terminarNaPosicaoX, duration: self.tempo)
        
        self.runAction(moverPara)
        
    }
    
}

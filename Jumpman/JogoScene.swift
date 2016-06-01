//
//  JogoScene.swift
//  Jumpman
//
//  Created by Matheus Alves on 31/05/16.
//  Copyright © 2016 Encosis 2016. All rights reserved.
//

import SpriteKit

class JogoScene: SKScene {
    
    
    override func didMoveToView(view: SKView) {
        
        self.animarNuvens()
        self.animarTerra()
        
    }
    
    func animarNuvens(){
        
        //Carregar objetos da cena (Nuvens)
        let nuvem0 = self.childNodeWithName("Nuvem_0") as! SKSpriteNode
        let nuvem1 = self.childNodeWithName("Nuvem_1") as! SKSpriteNode
        let nuvem2 = self.childNodeWithName("Nuvem_2") as! SKSpriteNode
        
        //Determinando um tempo aleatório e diferente para cada nuvem percorrer o cenario
        let tempo0 : NSTimeInterval = 20
        let tempo1 : NSTimeInterval = 27
        let tempo2 : NSTimeInterval = 34
        
        //Determinando a posição em X de onde o movimento deve terminar
        let larguraDeTela = self.size.width

        let posicaoQueTermina = -larguraDeTela/2
        let posicaoQueRecomeca = larguraDeTela/2
        
        //Criando a ação de mover
        let move0 = SKAction.moveToX( posicaoQueTermina - nuvem0.size.width , duration: tempo0)
        let move1 = SKAction.moveToX( posicaoQueTermina - nuvem1.size.width , duration: tempo1)
        let move2 = SKAction.moveToX( posicaoQueTermina - nuvem2.size.width , duration: tempo2)
        
        //Criando a ação para reiniciar a posição
        let reiniciar = SKAction.moveToX(posicaoQueRecomeca + nuvem0.size.width , duration: 0)
        
        //Criando a ação de mover e reiniciar em sequencia
        let movimento0 = SKAction.sequence([move0, reiniciar])
        let movimento1 = SKAction.sequence([move1, reiniciar])
        let movimento2 = SKAction.sequence([move2, reiniciar])
        
        //Criando a ação de loop de mover e reiniciar
        let loop0 = SKAction.repeatActionForever(movimento0)
        let loop1 = SKAction.repeatActionForever(movimento1)
        let loop2 = SKAction.repeatActionForever(movimento2)
        
        //Aplicando a ação aos objetos
        nuvem0.runAction(loop0)
        nuvem1.runAction(loop1)
        nuvem2.runAction(loop2)
        
    
    }
    
    func animarTerra(){
        
        //Determinar tempo geral para percorrer a tela
        let tempo : NSTimeInterval = 4
        
        //Carregando os objetos da cena
        let terra0 = self.childNodeWithName("Terra_0") as! SKSpriteNode
        let terra1 = self.childNodeWithName("Terra_1") as! SKSpriteNode
        let terra2 = self.childNodeWithName("Terra_2") as! SKSpriteNode
        
        //Determinando distancia a ser movida (tamanho da terra)
        let distancia = terra0.size.width
        
        //Criando ação de mover um "terra" para o lado
        let moveUm = SKAction.moveBy(CGVector(dx: -distancia, dy: 0), duration: tempo)
        //Criando a ação de reiniciar a posição
        let reiniciar = SKAction.moveToX(distancia*2, duration: 0)
        
        //Criando ação de mover cada um dos objetos "Terra"
        let movimento0 = SKAction.sequence([moveUm, reiniciar, moveUm, moveUm])
        let movimento1 = SKAction.sequence([moveUm, moveUm, reiniciar, moveUm])
        let movimento2 = SKAction.sequence([moveUm, moveUm, moveUm, reiniciar])
        
        //Criando ação de loop para o movimento de cada "Terra"
        let loop0 = SKAction.repeatActionForever(movimento0)
        let loop1 = SKAction.repeatActionForever(movimento1)
        let loop2 = SKAction.repeatActionForever(movimento2)
        
        //Aplicando a ação no objeto
        terra0.runAction(loop0)
        terra1.runAction(loop1)
        terra2.runAction(loop2)
        
    }
    
    
}
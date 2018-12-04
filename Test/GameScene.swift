//
//  GameScene.swift
//  Test
//
//  Created by Jason on 12/3/18.
//  Copyright © 2018 Jason. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var player = SKSpriteNode()
    
    // SprtieNodes are much more flexiable when it comes to gaming
  
    override func didMove(to view: SKView) {
  
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "RedPlayer") as! SKSpriteNode
        player = self.childNode(withName: "BluePlayer") as! SKSpriteNode
        
// forces it to be a SpriteNOde rather then a Sprite
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        let gameBoarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        gameBoarder.friction = 0
        gameBoarder.restitution = 1
        
        self.physicsBody = gameBoarder
        /*
 applys a push in the direction of dx which is the x axis and dy which is the y axsis
         
 */
        
 }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
  enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
    }
    
}

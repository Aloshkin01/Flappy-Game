//
//  GameScene.swift
//  Flappy-Game
//
//  Created by Vladimir Alyoshkin on 27.06.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
   
    var backgroundNode : SKNode!
    var birdNode : SKSpriteNode!
    var gameOverLable : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundNode = self.childNode(withName: "background")!
        birdNode = self.childNode(withName: "bird2") as! SKSpriteNode
        
        gameOverLable = self.childNode(withName: "gameOverLable") as! SKLabelNode
        
        gameOverLable.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        let moveBackgriund = SKAction.move(by: CGVector(dx: -500, dy:0), duration: 10)
        
        backgroundNode.run(moveBackgriund)
 }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 3))
    }
    
    func stopGame () {
        backgroundNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        
        gameOverLable.run(SKAction.fadeIn(withDuration: 0.5))
    }
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
    
}

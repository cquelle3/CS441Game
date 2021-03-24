//
//  GameScene.swift
//  Game
//
//  Created by Colin Quelle on 3/24/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode;
        ball.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 300));
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame);
        
        border.friction = 0;
        border.restitution = 1;
        
        self.physicsBody = border;
    }
    
    override func update(_ currentTime: TimeInterval){
        
    }
}

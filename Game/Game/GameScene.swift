//
//  GameScene.swift
//  Game
//
//  Created by Colin Quelle on 3/24/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, SKSceneDelegate {
    
    var points = [CGPoint]();
    var lineCollisions = [SKPhysicsBody]();
    
    var ball = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "Ball") as! SKSpriteNode;
        ball.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 300));
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame);
        
        border.friction = 0;
        border.restitution = 1;
        
        self.physicsBody = border;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //touchDown
        points.removeAll();
        lineCollisions.removeAll();
        for child in self.children{
            if(child.name == "Line"){
                child.physicsBody = nil;
                child.removeFromParent();
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //touchMoved
        for t in touches{
            points.append(t.location(in: self));
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //touchUp
        let linePath = CGMutablePath();
        linePath.move(to: points[0]);
        
        for p in points{
            linePath.addLine(to: p);
        }
        
        let line = SKShapeNode();
        line.path = linePath;
        line.lineWidth = 3;
        line.name = "Line";
        
        for p in 0..<points.count-1 {
            lineCollisions.append(SKPhysicsBody(edgeFrom: points[p], to: points[p+1]));
        }
        
        let collision = SKPhysicsBody(bodies: lineCollisions);
        collision.isDynamic = false;
        line.physicsBody = collision;
        
        self.addChild(line);
        //print(self.children);
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        if(contact.bodyA.node?.name == "Ball" && contact.bodyB.node?.name == "Line"){
            points.removeAll();
            lineCollisions.removeAll();
            contact.bodyB.node?.physicsBody = nil;
            contact.bodyB.node?.removeFromParent();
        }
    }
    
    override func update(_ currentTime: TimeInterval){
        
    }

}


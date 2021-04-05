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

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var points = [CGPoint]();
    var lineCollisions = [SKPhysicsBody]();
    
    var ball = SKSpriteNode();
    
    var gameOverLine = SKSpriteNode();
    var xPos = CGFloat(0.0);
    var yPos = CGFloat(0.0);
    
    var score = 0;
    var scoreLabel: SKLabelNode!

    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self;
        
        ball = self.childNode(withName: "Ball") as! SKSpriteNode;
        ball.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 300));
        
        gameOverLine = self.childNode(withName: "GameOverLine") as! SKSpriteNode;
        
        scoreLabel = self.childNode(withName: "Score") as? SKLabelNode;
        scoreLabel.text = String(score);
        
        xPos = gameOverLine.position.x;
        yPos = gameOverLine.position.y;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        for t in touches{
            points.append(t.location(in: self));
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        if(contact.bodyA.node?.name == "Line" && contact.bodyB.node?.name == "Ball"){
            points.removeAll();
            lineCollisions.removeAll();
            for child in self.children{
                if(child.name == "Line"){
                    child.physicsBody = nil;
                    child.removeFromParent();
                }
            }
        }
        
        if(contact.bodyA.node?.name == "PointLine" && contact.bodyB.node?.name == "Ball"){
            score = score + 1;
            scoreLabel.text = String(score);
            print(score);
         
            yPos = yPos + 40.0;
            if(yPos >= -528){
                yPos = -528;
            }
            let action = SKAction.move(to: CGPoint(x: 0.5, y: yPos), duration: 1);
            gameOverLine.run(action);
            //print(gameOverLine.position);
            
        }
        
        if(contact.bodyA.node?.name == "GameOverLine" && contact.bodyB.node?.name == "Ball"){
            self.removeFromParent();
            self.view?.presentScene(nil);
            MenuManager.manage.setStartButton(val: true);
        }
    }
    
    override func update(_ currentTime: TimeInterval){
        
    }

}


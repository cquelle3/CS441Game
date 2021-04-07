//
//  GameOverScene.swift
//  Game
//
//  Created by Colin Quelle on 4/5/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameOverScene: SKScene, SKPhysicsContactDelegate {

    var scoreLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        scoreLabel = self.childNode(withName: "ScoreLabel") as? SKLabelNode;
        scoreLabel.text = String("Score: " + String(MenuManager.manage.getScore()));
        MenuManager.manage.setGameOverInfo(val: true);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromParent();
        self.view?.presentScene(nil);
        MenuManager.manage.setStartButton(val: true);
        if(MenuManager.manage.getGameOverInfo() == true){
            MenuManager.manage.setGameOverInfo(val: false);
            let score = MenuManager.manage.getScore();
            MenuManager.manage.addHighScore(val: score, s: "Player");
        }
    }
    
}

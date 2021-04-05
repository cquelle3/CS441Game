//
//  GameViewController.swift
//  Game
//
//  Created by Colin Quelle on 3/24/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var highScoreButton: UIButton!
    @IBOutlet var instructionsButton: UIButton!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.checkStart), userInfo: nil, repeats: true)
    }
    
    @IBAction func start(_sender: UIButton){
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                
                //startButton.isHidden = true;
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                //let transition = SKTransition.moveIn(with: .right, duration: 10);
                
                // Present the scene
                view.presentScene(scene);
                //view.presentScene(scene, transition: transition)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            MenuManager.manage.setStartButton(val: false);
        }
    }
    
    @objc func checkStart(){
        if(MenuManager.manage.getStartButton() == true){
            startButton.isHidden = false;
            highScoreButton.isHidden = false;
            instructionsButton.isHidden = false;
        }
        else{
            startButton.isHidden = true;
            highScoreButton.isHidden = true;
            instructionsButton.isHidden = true;
        }
    }
    
    /*
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
 */
}

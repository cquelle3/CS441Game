//
//  MenuManager.swift
//  Game
//
//  Created by Colin Quelle on 4/5/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import Foundation

class MenuManager{
    
    var score = 0;
    var enableStartButton = true;
    var scores = [Int]();
    
    func setStartButton(val: Bool){
        enableStartButton = val;
    }
    
    func getStartButton() -> Bool{
        return enableStartButton;
    }
    
    func setScore(val: Int){
        score = val;
    }
    
    func getScore() -> Int{
        return score;
    }
    
    func addScore(val: Int){
        scores.append(score);
        print(scores);
    }
    
    func getScores() -> [Int]{
        return scores;
    }
    
    public static let manage = MenuManager();
}

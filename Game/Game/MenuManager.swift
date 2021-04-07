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
    var checkGameOverInfo = false;
    var scores = [Int]();
    var names = [String]();
    
    var highScores:[(name: String, value: Int)] = []
    
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
    
    func addHighScore(val: Int, s: String){
        highScores.append((s, val));
        
        let dictionary = highScores.reduce(into: [:]) { $0[$1.0] = $1.1 };
        UserDefaults.standard.set(dictionary, forKey: "highScores");
    }
    
    func getHighScores() -> [String : Int]{
        if let loadData = UserDefaults.standard.object (forKey: "highScores") as? [String:Int] {
            return loadData;
        }
        else{
            return [String : Int]();
        }
    }
    
    func setGameOverInfo(val: Bool){
        checkGameOverInfo = val;
    }
    
    func getGameOverInfo() -> Bool{
        return checkGameOverInfo;
    }
    
    public static let manage = MenuManager();
}

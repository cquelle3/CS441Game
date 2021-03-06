//
//  HighScores.swift
//  Game
//
//  Created by Colin Quelle on 4/5/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import Foundation
import UIKit

class HighScores: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        table.dataSource = self;
        table.delegate = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuManager.manage.getScores().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        //cell.textLabel?.text = String(MenuManager.manage.getScores().sorted().reversed()[indexPath.row]);
        let sorted = MenuManager.manage.getHighScores().sorted(by: {$0.1 > $1.1});
        let name = sorted[indexPath.row].0;
        let score = String(sorted[indexPath.row].1);
        cell.textLabel?.text = name + ": " + score;
        return cell;
    }
    
}

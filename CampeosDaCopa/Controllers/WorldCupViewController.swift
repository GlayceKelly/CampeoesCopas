//
//  WorldCupViewController.swift
//  CampeosDaCopa
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //Variaveis da classe
    var worldCup: WorldCup!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WorldCup \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }
}

extension WorldCupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        //Recupera o match (fases) e o game
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        
        cell.prepare(with: game)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
}

extension WorldCupViewController: UITableViewDelegate {
    
}

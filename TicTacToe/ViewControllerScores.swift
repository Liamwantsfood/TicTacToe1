//
//  ViewControllerScores.swift
//  TicTacToe
//
//  Created by WILLIAM COX on 12/12/23.
//

import UIKit

class ViewControllerScores: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.scoresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        if AppData.scoresList.count > 0 {
            cell.textLabel?.text = AppData.scoresList[indexPath.row].poneName + ": \(AppData.scoresList[indexPath.row].ponewins) " + AppData.scoresList[indexPath.row].ptwoName + ": \(AppData.scoresList[indexPath.row].ptwowins) Ties: " + "\(AppData.scoresList[indexPath.row].ties)"
        } else {
            cell.textLabel?.text = "No scores recorded yet, play a game!"
        }
        return cell
    }
    
    
}

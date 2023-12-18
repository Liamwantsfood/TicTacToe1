//
//  ViewController.swift
//  TicTacToe
//
//  Created by WILLIAM COX on 12/5/23.
//


// code elements
// 1. Variables & constants
// 2. Operators (+,-,/,*,%, &&, ||)
// 3. if/else
// 4. Arrays
// 5. Functions
// 6. Optionals
// 7. Classes
// 8. Enums
// 9. Safely unwrapping
// 10. Persistence with User Defaults

//UI Elements
// 1. Text Field
// 2. Button
// 3. Label
// 4. Table View
// 5. Image View
// 6. Navigation Controller
// 7. View Controller
// 8. Alert Controller


import UIKit

public class scores: Encodable, Decodable {
    var ponewins: Int
    var ptwowins: Int
    var poneName: String
    var ptwoName: String
    var ties: Int
    
    public init(ponewins: Int, ptwowins: Int, poneName: String, ptwoName: String, ties: Int) {
        self.ponewins = ponewins
        self.ptwowins = ptwowins
        self.poneName = poneName
        self.ptwoName = ptwoName
        self.ties = ties
    }
}

public class AppData {
    static var scoresList = [scores]()
}

enum xo {
    case x
    case o
    case blank
}

class ViewController: UIViewController {

    @IBOutlet weak var tiesAmount: UILabel!
    let defaults = UserDefaults.standard
    
    var xwins = 0
    var owins = 0
    var ties = 0
    
    var nameGiven = 0
    
    @IBOutlet weak var playerOneName: UITextField!
    @IBOutlet weak var playerTwoName: UITextField!
    
    @IBOutlet weak var player1wins: UILabel!
    @IBOutlet weak var player2wins: UILabel!
    
    @IBOutlet weak var currentTurn: UILabel!
    
    
    @IBOutlet weak var p1names: UILabel!
    @IBOutlet weak var p2names: UILabel!
    
    
    @IBOutlet weak var topLeft: UIImageView!
    @IBOutlet weak var topLeftOutlet: UIButton!
    @IBOutlet weak var topMiddleButton: UIButton!
    @IBOutlet weak var topMiddleImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!
    @IBOutlet weak var middleLeftImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var middleRightImage: UIImageView!
    //bottom right is bottom left, swapped
    @IBOutlet weak var bottomRightImage: UIImageView!
    @IBOutlet weak var bottomMiddleImage: UIImageView!
    //bottom left is bottom right, swapped
    @IBOutlet weak var bottomLeftImage: UIImageView!
    
    //checks to see if certain button is pressed
    var topLeftCheck = false
    var topMiddleCheck = false
    var topRightCheck = false
    
    var middleLeftCheck = false
    var middleCheck = false
    var middleRightCheck = false
    
    var bottomLeftCheck = false
    var bottomMiddleCheck = false
    var bottomRightCheck = false
    
    //square vals, 0 = o, 1 = y
    var topLeftVal = xo.blank
    var topMiddleVal = xo.blank
    var topRightVal = xo.blank
    
    var middleLeftVal = xo.blank
    var middleVal = xo.blank
    var middleRightVal = xo.blank
    
    var bottomLeftVal = xo.blank
    var bottomMiddleVal = xo.blank
    var bottomRightVal = xo.blank
    
    
    var p1name = ""
    var p2name = ""
    
    var turn = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1wins.text = "\(owins)"
        player2wins.text = "\(xwins)"
        tiesAmount.text = "\(ties)"
        
//        AppData.scoresList.append(scores(ponewins: 5, ptwowins: 3))
        
        if let items = UserDefaults.standard.data(forKey: "theScores") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([scores].self, from: items) {
                if decoded.count > 0 {
                    AppData.scoresList = decoded
                }
            }
        }
    }

    //when turn = 1, o is placed, when turn = -1, x is placed
    @IBAction func topLeft(_ sender: Any) {
        if topLeftCheck == false {
            if turn == 1 {
                topLeft.image = UIImage(named: "playO")
                topLeftVal = xo.o
                turn = turn * -1
            } else {
                topLeft.image = UIImage(named: "x")
                topLeftVal = xo.x
                turn = turn * -1
            }
            topLeftCheck = true
            winCheck()
            changeLabel()
        }
    }
    
    @IBAction func topMiddle(_ sender: Any) {
        if topMiddleCheck == false {
            if turn == 1 {
                topMiddleImage.image = UIImage(named: "playO")
                topMiddleVal = xo.o
                turn = turn * -1
            } else {
                topMiddleImage.image = UIImage(named: "x")
                topMiddleVal = xo.x
                turn = turn * -1
            }
            topMiddleCheck = true
            winCheck()
            changeLabel()
        }
        
    }
    @IBAction func topRight(_ sender: Any) {
        if topRightCheck == false {
            if turn == 1 {
                topRightImage.image = UIImage(named: "playO")
                topRightVal = xo.o
                turn = turn * -1
            } else {
                topRightImage.image = UIImage(named: "x")
                topRightVal = xo.x
                turn = turn * -1
            }
            topRightCheck = true
            winCheck()
            changeLabel()
        }
    }
    @IBAction func middleLeft(_ sender: Any) {
        if middleLeftCheck == false {
            if turn == 1 {
                middleLeftImage.image = UIImage(named: "playO")
                middleLeftVal = xo.o
                turn = turn * -1
            } else {
                middleLeftImage.image = UIImage(named: "x")
                middleLeftVal = xo.x
                turn = turn * -1
            }
            middleLeftCheck = true
            winCheck()
            changeLabel()
        }
    }
    @IBAction func middle(_ sender: Any) {
        if middleCheck == false {
            if turn == 1 {
                middleImage.image = UIImage(named: "playO")
                middleVal = xo.o
                turn = turn * -1
            } else {
                middleImage.image = UIImage(named: "x")
                middleVal = xo.x
                turn = turn * -1
            }
            middleCheck = true
            winCheck()
            changeLabel()
        }
    }
    @IBAction func middleRight(_ sender: Any) {
        if middleRightCheck == false {
            if turn == 1 {
                middleRightImage.image = UIImage(named: "playO")
                middleRightVal = xo.o
                turn = turn * -1
            } else {
                middleRightImage.image = UIImage(named: "x")
                middleRightVal = xo.x
                turn = turn * -1
            }
            middleRightCheck = true
            winCheck()
            changeLabel()
        }
    }
    @IBAction func bottomLeft(_ sender: Any) {
        if bottomLeftCheck == false {
            if turn == 1 {
                bottomRightImage.image = UIImage(named: "playO")
                bottomLeftVal = xo.o
                turn = turn * -1
            } else {
                bottomRightImage.image = UIImage(named: "x")
                bottomLeftVal = xo.x
                turn = turn * -1
            }
            bottomLeftCheck = true
            winCheck()
            changeLabel()
        }
    }
    
    @IBAction func bottomMiddle(_ sender: Any) {
        if bottomMiddleCheck == false {
            if turn == 1 {
                bottomMiddleImage.image = UIImage(named: "playO")
                bottomMiddleVal = xo.o
                turn = turn * -1
            } else {
                bottomMiddleImage.image = UIImage(named: "x")
                bottomMiddleVal = xo.x
                turn = turn * -1
            }
            bottomMiddleCheck = true
            winCheck()
            changeLabel()
        }
    }
    
    @IBAction func bottomRight(_ sender: Any) {
        if bottomRightCheck == false {
            if turn == 1 {
                bottomLeftImage.image = UIImage(named: "playO")
                bottomRightVal = xo.o
                turn = turn * -1
            } else {
                bottomLeftImage.image = UIImage(named: "x")
                bottomRightVal = xo.x
                turn = turn * -1
            }
            bottomRightCheck = true
            winCheck()
            changeLabel()
        }
    }
    
    func winCheck() {
        //square vals, 0 = o, 1 = y
//        var topLeftVal = 2
//        var topMiddleVal = 2
//        var topRightVal = 2
//
//        var middleLeftVal = 2
//        var middleVal = 2
//        var middleRightVal = 2
//
//        var bottomLeftVal = 2
//        var bottomMiddleVal = 2
//        var bottomRightVal = 2
        
        //o checks
        if topLeftVal == xo.o && topMiddleVal == xo.o && topRightVal == xo.o {
         winseq(winner: 0)
        }
        else if middleLeftVal == xo.o && middleVal == xo.o && middleRightVal == xo.o {
            winseq(winner: 0)
        } else if bottomLeftVal == xo.o && bottomMiddleVal == xo.o && bottomRightVal == xo.o {
            winseq(winner: 0)
        } else if topLeftVal == xo.o && middleLeftVal == xo.o && bottomLeftVal == xo.o {
            winseq(winner: 0)
        } else if topMiddleVal == xo.o && middleVal == xo.o && bottomMiddleVal == xo.o {
            winseq(winner: 0)
        } else if topRightVal == xo.o && middleRightVal == xo.o && bottomRightVal == xo.o {
            winseq(winner: 0)
        } else if topLeftVal == xo.o && middleVal == xo.o && bottomRightVal == xo.o {
            winseq(winner: 0)
        } else if topRightVal == xo.o && middleVal == xo.o && bottomLeftVal == xo.o {
            winseq(winner: 0)
        }
        //x check
        if topLeftVal == xo.x && topMiddleVal == xo.x && topRightVal == xo.x {
            winseq(winner: 1)
        }
        else if middleLeftVal == xo.x && middleVal == xo.x && middleRightVal == xo.x {
            winseq(winner: 1)
        } else if bottomLeftVal == xo.x && bottomMiddleVal == xo.x && bottomRightVal == xo.x {
            winseq(winner: 1)
        } else if topLeftVal == xo.x && middleLeftVal == xo.x && bottomLeftVal == xo.x {
            winseq(winner: 1)
        } else if topMiddleVal == xo.x && middleVal == xo.x && bottomMiddleVal == xo.x {
            winseq(winner: 1)
        } else if topRightVal == xo.x && middleRightVal == xo.x && bottomRightVal == xo.x {
            winseq(winner: 1)
        } else if topLeftVal == xo.x && middleVal == xo.x && bottomRightVal == xo.x {
            winseq(winner: 1)
        } else if topRightVal == xo.x && middleVal == xo.x && bottomLeftVal == xo.x {
            winseq(winner: 1)
        } else if ((topLeftVal == xo.x || topLeftVal == xo.o) && (topMiddleVal == xo.x || topMiddleVal == xo.o) && (topRightVal == xo.x || topRightVal == xo.o) && (middleLeftVal == xo.x || middleLeftVal == xo.o) && (middleVal == xo.x || middleVal == xo.o) && (middleRightVal == xo.x || middleRightVal == xo.o) && (bottomLeftVal == xo.x || bottomLeftVal == xo.o) && (bottomMiddleVal == xo.x || bottomMiddleVal == xo.o) && (bottomRightVal == xo.x || bottomRightVal == xo.o)) {
            winseq(winner: 2)
        }
        
    }
    
    func reset() {
        turn = 1
        topLeftCheck = false
        topMiddleCheck = false
        topRightCheck = false
        middleLeftCheck = false
        middleCheck = false
        middleRightCheck = false
        bottomLeftCheck = false
        bottomMiddleCheck = false
        bottomRightCheck = false
        topLeftVal = xo.blank
        topMiddleVal = xo.blank
        topRightVal = xo.blank
        middleLeftVal = xo.blank
        middleVal = xo.blank
        middleRightVal = xo.blank
        bottomLeftVal = xo.blank
        bottomMiddleVal = xo.blank
        bottomRightVal = xo.blank
        topLeft.image = UIImage(named: "")
        topMiddleImage.image = UIImage(named: "")
        topRightImage.image = UIImage(named: "")
        middleLeftImage.image = UIImage(named: "")
        middleImage.image = UIImage(named: "")
        middleRightImage.image = UIImage(named: "")
        bottomLeftImage.image = UIImage(named: "")
        bottomMiddleImage.image = UIImage(named: "")
        bottomRightImage.image = UIImage(named: "")
    }
    
    func winseq (winner: Int) {
        if winner == 0 {
            owins = owins + 1
            player1wins.text = "\(owins)"
            let alert1 = UIAlertController(title: "Player 1 wins!", message: "Play again?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default , handler: nil)
            alert1.addAction(yesAction)
            present(alert1, animated: true, completion: nil)
        } else if winner == 1 {
            xwins = xwins + 1
            player2wins.text = "\(xwins)"
            let alert1 = UIAlertController(title: "Player 2 wins!", message: "Play again?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default , handler: nil)
            alert1.addAction(yesAction)
            present(alert1, animated: true, completion: nil)
        } else {
            ties = ties + 1
            tiesAmount.text = "\(ties)"
            
            let alert1 = UIAlertController(title: "Tie", message: "Play again?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default , handler: nil)
            alert1.addAction(yesAction)
            present(alert1, animated: true, completion: nil)
        }

        if owins > 4 {
            if nameGiven == 0 {
                let userScores = scores(ponewins: owins, ptwowins: xwins, poneName: "Player 1", ptwoName: "Player 2", ties: ties)
                AppData.scoresList.append(userScores)
                owins = 0
                xwins = 0
                ties = 0
                player1wins.text = "\(0)"
                player2wins.text = "\(0)"
                tiesAmount.text = "\(0)"
                let encoder = JSONEncoder()
                
                if let encoded = try? encoder.encode(AppData.scoresList) {
                    defaults.set(encoded, forKey: "theScores")
                }
            } else {
                let userScores = scores(ponewins: owins, ptwowins: xwins, poneName: "\(p1name)", ptwoName: "\(p2name)", ties: ties)
                AppData.scoresList.append(userScores)
                owins = 0
                xwins = 0
                ties = 0
                player1wins.text = "\(0)"
                player2wins.text = "\(0)"
                tiesAmount.text = "\(0)"
                let encoder = JSONEncoder()
                
                if let encoded = try? encoder.encode(AppData.scoresList) {
                    defaults.set(encoded, forKey: "theScores")
                }
            }


        } else if xwins > 4 {
            if nameGiven == 0 {
                let userScores = scores(ponewins: owins, ptwowins: xwins, poneName: "Player 1", ptwoName: "Player 2", ties: ties)
                AppData.scoresList.append(userScores)
                owins = 0
                xwins = 0
                ties = 0
                tiesAmount.text = "\(0)"
                player1wins.text = "\(0)"
                player2wins.text = "\(0)"
                let encoder = JSONEncoder()
                
                if let encoded = try? encoder.encode(AppData.scoresList) {
                    defaults.set(encoded, forKey: "theScores")
                }
            } else {
                let userScores = scores(ponewins: owins, ptwowins: xwins, poneName: "\(p1name)", ptwoName: "\(p2name)", ties: ties)
                AppData.scoresList.append(userScores)
                owins = 0
                xwins = 0
                ties = 0
                player1wins.text = "\(0)"
                player2wins.text = "\(0)"
                tiesAmount.text = "\(0)"
                let encoder = JSONEncoder()
                
                if let encoded = try? encoder.encode(AppData.scoresList) {
                    defaults.set(encoded, forKey: "theScores")
                }
            }
        }
        reset()
    }
    func changeLabel() {
        if turn > 0 {
            currentTurn.text = "O"
        } else {
            currentTurn.text = "X"
        }
    }
    
    
    @IBAction func setNames(_ sender: Any) {
        p1name = playerOneName.text!
        p2name = playerTwoName.text!
        
        p1names.text = p1name
        p2names.text = p2name
        
        nameGiven = 1
        
    }
    
    
}


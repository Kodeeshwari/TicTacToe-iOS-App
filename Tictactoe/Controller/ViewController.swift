//
//  ViewController.swift
//  Tictactoe
//
//  Created by Kodeeshwari Solanki on 2023-06-13.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var boardCell: UIButton!
    
    var player = PlayerModel()
    var cellClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //boardCell.tintColor = UIColor(red: 12.0/255.0, green: 16.0/255.0, blue: 23/255.0, alpha: 0.6)
        //boardCell.backgroundColor = UIColor.cyan
    }
    
    @IBAction func playerMoveBtnTouchupInside(_ sender: UIButton) {
      
        let playerSymbol = player.SwitchPlayer()
        lblTitle.text = "Player \(playerSymbol) Turn"
        sender.isEnabled = false
        sender.layer.borderColor = UIColor.blue.cgColor
        sender.layer.borderWidth = 1.5
        sender.layer.cornerRadius = 2
        sender.setTitle(playerSymbol, for: .normal)
        sender.setTitleColor(.white, for: .highlighted)
        
        
        let btnNumber = sender.tag
        let row = btnNumber / 3
        let column = btnNumber % 3
        
      //  print("row = \(row)...Column = \(column)")
        
        player.updateGameBoardArray(row: row, column: column, playerSymbol: playerSymbol)
        
        var win = player.checkWinCondition()
        
        if(win){
            lblTitle.text = "Player \(playerSymbol) Won"
            lblTitle.textColor = UIColor.blue
            self.view.isUserInteractionEnabled = false
        }
        else{
            cellClicked+=1
        }
        if(cellClicked==9){
            lblTitle.text = "Draw"
            lblTitle.textColor = UIColor.red
           
        }
        

    }
    
}


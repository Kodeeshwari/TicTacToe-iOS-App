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
    var playerSymbol : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playerMoveBtnTouchupInside(_ sender: UIButton) {
        
        playerSymbol = player.SwitchPlayer()
        lblTitle.text = "Player \(playerSymbol) played"
        
        setupButtonStyle(sender, playerSymbol)
        updateGameBoard(sender, playerSymbol)
        
        let win = player.checkWinCondition()
        
        if win {
            handleWinCondition(playerSymbol)
        } else {
            cellClicked += 1
            if cellClicked == 9 {
                handleDrawCondition()
            }
        }
    }
    
    func setupButtonStyle(_ button : UIButton, _ playerSymbol : String){
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 2
        button.setTitle(playerSymbol, for: .normal)
        
        let borderColor: UIColor
        let textColor: UIColor
        
        if playerSymbol == "X" {
            borderColor = .cyan
            textColor = .cyan
        } else {
            borderColor = .orange
            textColor = .orange
        }
        
        button.layer.borderColor = borderColor.cgColor
        button.setTitleColor(textColor, for: .normal)
        button.setTitleColor(textColor, for: .disabled)
        button.isEnabled = false
    }
    
    func updateGameBoard(_ sender : UIButton, _ playerSymbol : String){
        let btnNumber = sender.tag
        let row = btnNumber / 3
        let column = btnNumber % 3
        
        player.updateGameBoardArray(row: row, column: column, playerSymbol: playerSymbol)
    }
    
    func handleWinCondition(_ playerSymbol: String) {
        lblTitle.text = "Player \(playerSymbol) Won"
        let textColor: UIColor = (playerSymbol == "X") ? .cyan : .orange
        lblTitle.textColor = textColor
        self.view.isUserInteractionEnabled = false
    }
    
    func handleDrawCondition() {
        lblTitle.text = "Draw"
        lblTitle.textColor = .red
        self.view.isUserInteractionEnabled = false
    }
}


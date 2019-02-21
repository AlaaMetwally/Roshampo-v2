//
//  ResultPlay.swift
//  RoShamPo_1
//
//  Created by Geek on 1/9/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

enum Shape: String{
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape{
       let shape = ["Rock","Scissors","Paper"]
       let randomChoice = Int(arc4random_uniform(3))
       return Shape(rawValue: shape[randomChoice])!
    }
    
}

class ResultPlay: UIViewController {
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    private func displayResult(){
        var text: String
        var image: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        switch(userChoice!,opponentChoice){
        case let (user,opponent) where user == opponent :
            text =  "\(matchup), its a tie"
            image = "itsATie"
        case(.Rock,.Scissors),(.Scissors,.Paper),(.Paper,.Rock):
            text = "\(matchup), You Win"
            image = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "\(matchup), You Lose"
            image = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        labelResult.text = text
        imageResult.image = UIImage(named: image.lowercased())
    }
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

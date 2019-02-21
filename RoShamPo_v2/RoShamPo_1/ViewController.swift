//
//  ViewController.swift
//  RoShamPo_1
//
//  Created by Geek on 1/9/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var paper: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        
        let controller: ResultPlay
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultPlay") as! ResultPlay
        controller.userChoice = getUserChoice(sender)
        present(controller, animated: true, completion: nil)
    }
    @IBAction func playRock() {
        performSegue(withIdentifier: "ResultPlay", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultPlay" {
            let controller = segue.destination as! ResultPlay
            controller.userChoice = getUserChoice(sender as! UIButton)
        }
    }
    
    private func getUserChoice(_ sender: UIButton) -> Shape{
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }
   
}


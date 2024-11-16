//
//  ScoreViewController.swift
//  Quiz App
//
//  Created by Blith Correia on 2024-11-15.
//

import Foundation
import UIKit

class ScoreViewController: UIViewController {

    // Outlet for the score label
    @IBOutlet weak var scoreLabel: UILabel!

    // Property to receive the score from QuizPageController
    var finalScore: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Display the score when the score screen is shown
        if let score = finalScore {
            scoreLabel.text = "Your Score: \(score)"
        }
    }
    
   
    
    
}


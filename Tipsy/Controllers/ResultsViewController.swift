//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Moe Chaker on 10/30/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipText: String?
    var totalPerPerson: String?
    var numberOfPeople: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson!
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipText!)% tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

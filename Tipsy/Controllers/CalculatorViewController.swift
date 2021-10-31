//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip: Double = 0.0
    var numberOfPeople: Int = 0
    var totalAmount: Double = 0.0
    var amountPerPerson: Double = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        numberOfPeople = Int(sender.value)
        
        splitNumberLabel.text = String(numberOfPeople)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalAmount = Double(billTextField.text!) ?? 0.0
        amountPerPerson = (totalAmount + (totalAmount * tip)) / Double(numberOfPeople)
        amountPerPerson = round(amountPerPerson * 100) / 100.0
        print(amountPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipText = String(Int(tip*100))
            destinationVC.numberOfPeople = String(self.numberOfPeople)
            destinationVC.totalPerPerson = String(amountPerPerson)
        }
    }


}


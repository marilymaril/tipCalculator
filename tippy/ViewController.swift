//
//  ViewController.swift
//  tippy
//
//  Created by Marilyn Florek on 8/29/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject)
    {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.20,0.25]
        let bill = Double(billField.text!) ?? 0
        // ?? => means if whatever is there is equal to null then return 0
        let tip = Double(bill * tipPercentages[tipControl.selectedSegmentIndex])
        let total = Double(bill + tip)
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }
    
    
    
}


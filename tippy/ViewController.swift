//
//  ViewController.swift
//  tippy
//
//  Created by Marilyn Florek on 8/29/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit

extension Locale {
    static let USD = Locale(identifier: "en_US")
    static let GBP = Locale(identifier: "en_UK")
}

extension NumberFormatter {
    convenience init(style: Style, locale: Locale = .current) {
        self.init()
        self.locale = locale
        numberStyle = style
    }
}

extension Formatter {
    static let currency = NumberFormatter(style: .currency)
    static let currencyUS = NumberFormatter(style: .currency, locale: .USD)
}

extension Numeric {   // for Swift 3 use FloatingPoint or Int
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
    var currencyUS: String {
        return Formatter.currencyUS.string(for: self) ?? ""
    }
}

class ViewController: UIViewController
{
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var settingsController: SettingsViewController = SettingsViewController(nibName: nil, bundle: nil)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject)
    {
//        let currencySelection = settingsController.pickerView
//        print(currencySelection.)
        
        Formatter.currency.locale = .USD
    
        let tipPercentages = [0.18,0.20,0.25]
        let bill = Double(billField.text!) ?? 0
        // ?? => means if whatever is there is equal to null then return 0
        let tip = Double(bill * tipPercentages[tipControl.selectedSegmentIndex])
        let total = Double(bill + tip)
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = total.currency
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
}


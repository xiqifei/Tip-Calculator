//
//  ViewController.swift
//  Prework_xiqi
//
//  Created by Xiqi on 11/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let theme_light = defaults.integer(forKey: "theme")
        print(theme_light)
        if theme_light == 1{
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
        
        let tip1_value = defaults.string(forKey: "tip1") ?? "15%"
        let tip2_value = defaults.string(forKey: "tip2") ?? "18%"
        let tip3_value = defaults.string(forKey: "tip3") ?? "20%"

        
        if !tip1_value.isEmpty{
            tipControl.setTitle(tip1_value, forSegmentAt: 0)
        }
        if !tip2_value.isEmpty{
            tipControl.setTitle(tip2_value, forSegmentAt: 1)
        }
        if !tip3_value.isEmpty{
            tipControl.setTitle(tip3_value, forSegmentAt: 2)
        }
        
        
        let bamt = defaults.string(forKey: "billamt") ?? ""
        let tamt = defaults.string(forKey: "tipamt") ?? "$0.00"
        let ttamt = defaults.string(forKey: "totalamt") ?? "$0.00"

        
        
        if !bamt.isEmpty{
            billAmountTextField.text = bamt
        }
        if !tamt.isEmpty{
            tipAmountLabel.text = tamt
        }
        if !ttamt.isEmpty{
            totalLabel.text = ttamt
        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        billAmountTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    @IBAction func calculateTip(_ sender: Any) {
        //Get the initial bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let t1 = Double((String(tipControl.titleForSegment(at: 0)!).dropLast()))!/100
        let t2 = Double((String(tipControl.titleForSegment(at: 1)!).dropLast()))!/100
        let t3 = Double((String(tipControl.titleForSegment(at: 2)!).dropLast()))!/100

        
        //Calculate the tip and then total
        let tipPercentages = [t1, t2, t3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(billAmountTextField.text, forKey: "billamt")
        defaults.set(tipAmountLabel.text, forKey: "tipamt")
        defaults.set(totalLabel.text, forKey: "totalamt")
    }
    
}


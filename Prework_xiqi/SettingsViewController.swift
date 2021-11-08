//
//  SettingsViewController.swift
//  Prework_xiqi
//
//  Created by Xiqi on 11/7/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    @IBOutlet weak var lightControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let theme_light = defaults.integer(forKey: "theme")
        print(theme_light)
        if theme_light == 1{
            overrideUserInterfaceStyle = .dark
            lightControl.selectedSegmentIndex = 1
        }else{
            overrideUserInterfaceStyle = .light
            lightControl.selectedSegmentIndex = 0

        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        tip1.keyboardType = UIKeyboardType.numbersAndPunctuation
        tip1.becomeFirstResponder()
    }

    @IBAction func changeLight(_ sender: Any) {
        let defaults = UserDefaults.standard
        if lightControl.selectedSegmentIndex == 1{
            overrideUserInterfaceStyle = .dark
            defaults.set(1, forKey: "theme")
        }else{
            overrideUserInterfaceStyle = .light
            defaults.set(0, forKey: "theme")
        }
        defaults.synchronize()
    }
    
    
    @IBAction func tipUpdate(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(tip1.text, forKey: "tip1")
        defaults.set(tip2.text, forKey: "tip2")
        defaults.set(tip3.text, forKey: "tip3")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

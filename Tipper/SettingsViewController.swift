//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Tommy Kim on 1/19/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let tipPercentages = [0.15, 0.18, 0.20]
    
    @IBOutlet weak var defControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let defaults = UserDefaults.standard
        let defValue = defaults.double(forKey: "def")
        
        for index in 0..<tipPercentages.count {
             if defValue == tipPercentages[index] {
                 defControl.selectedSegmentIndex = index
                 break
             }
         }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let def = tipPercentages[defControl.selectedSegmentIndex]
        
        let defaults = UserDefaults.standard

        defaults.set(def, forKey: "def")
      
        defaults.synchronize()
    }
}

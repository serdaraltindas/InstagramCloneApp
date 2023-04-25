//
//  SettingsViewController.swift
//  InstagramCloneApp
//
//  Created by Serdar Altındaş on 25.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func cikisYapButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainVC", sender: self)
        
    }
    
    @IBAction func cikisYapButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainVC", sender: self)
    }
    
}

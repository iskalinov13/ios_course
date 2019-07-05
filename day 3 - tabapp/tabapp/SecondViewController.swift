//
//  SecondViewController.swift
//  tabapp
//
//  Created by Olzhas Akhmetov on 7/3/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if let str = UserDefaults.standard.string(forKey: "text") {
            label.text = str
        }
    }

}


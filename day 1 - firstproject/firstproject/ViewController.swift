//
//  ViewController.swift
//  firstproject
//
//  Created by Olzhas Akhmetov on 7/1/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touched(_ sender: Any) {
        let a = textfield1.text
        let b = textfield2.text
        label.text = "sum a + b = \(Int(a!)! + Int(b!)!)"
    }
    @IBAction func minus(_ sender: Any) {
        let a = textfield1.text
        let b = textfield2.text
        label.text = "sum a - b = \(Int(a!)! - Int(b!)!)"
    }
    @IBAction func delenie(_ sender: Any) {
        let a = textfield1.text
        let b = textfield2.text
        label.text = "sum a / b = \(Double(a!)! / Double(b!)!)"
    }
    @IBAction func umnozhenie(_ sender: Any) {
        let a = textfield1.text
        let b = textfield2.text
        label.text = "sum a * b = \(Int(a!)! * Int(b!)!)"
    }
    
}


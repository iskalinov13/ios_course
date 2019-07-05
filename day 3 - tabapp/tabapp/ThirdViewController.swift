//
//  ThirdViewController.swift
//  tabapp
//
//  Created by Olzhas Akhmetov on 7/3/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    

    
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func saveString(_ sender: Any) {
        
        let userdefaults = UserDefaults.standard
        
        userdefaults.set(textfield.text, forKey: "text")
        
        userdefaults.synchronize()
        
        var array = [""]
        
        if let arr = userdefaults.array(forKey: "array") as? [String] {
            
            array = arr
            
            array.append(textfield.text!)
            
            userdefaults.set(array, forKey: "array")
        } else {
            
            array = [textfield.text!]
            
            userdefaults.set(array, forKey: "array")
        }
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

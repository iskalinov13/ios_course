//
//  loginViewController.swift
//  instagram
//
//  Created by Olzhas Akhmetov on 2/21/18.
//  Copyright © 2018 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserDefaults.standard.removeObject(forKey: "access_token")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let token = UserDefaults.standard.string(forKey: "access_token") {
            let instaViewController = self.storyboard?.instantiateViewController(withIdentifier: "instaViewController")
            self.present(instaViewController!, animated: true, completion: nil)
        }
    }
    
    @IBAction func openInstaweb(_ sender: Any) {
        let webviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "webviewcontroller")
        self.present(webviewcontroller!, animated: true, completion: nil)
    }
    
}

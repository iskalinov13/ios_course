//
//  ViewController.swift
//  tableview
//
//  Created by Olzhas Akhmetov on 7/2/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var city = ""
    var imagename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = city
        imageview.image = UIImage(named: imagename)
    }


}


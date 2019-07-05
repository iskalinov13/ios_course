//
//  TableViewController.swift
//  tableview
//
//  Created by Olzhas Akhmetov on 7/2/19.
//  Copyright © 2019 Olzhas Akhmetov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = ["Almaty", "Kyzylorda", "Ural", "Semsk", "Kokshetau", "Karaganda"]
    
    var arrayImage = ["ALA", "PWQ", "URAL", "CIT", "ALA", "PWQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        array.append("lll")
        arrayImage.append("ALA")
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = array[indexPath.row]
        
        let imageView = cell.viewWithTag(1000) as! UIImageView
        imageView.image = UIImage(named: arrayImage[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 192.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        viewController.city = array[indexPath.row]
        viewController.imagename = arrayImage[indexPath.row]
        
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

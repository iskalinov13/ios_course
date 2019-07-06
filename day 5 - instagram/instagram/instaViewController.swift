//
//  ViewController.swift
//  instagram
//
//  Created by Olzhas Akhmetov on 1/30/18.
//  Copyright © 2018 Olzhas Akhmetov. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SDWebImage
import SwiftyJSON

class instaViewController: UITableViewController {
    
    var arrayInsta:[instaClass] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - downloadData
    fileprivate func downloadData() {
        SVProgressHUD.show()
        let token:String! = UserDefaults.standard.string(forKey: "access_token")
        print("https://api.instagram.com/v1/users/self/media/recent/?access_token=" + token + ")&count=10")
        Alamofire.request("https://api.instagram.com/v1/users/self/media/recent/?access_token=" + token + "&count=10", method: .get).responseJSON { response in
            
            print("\(String(describing: response.request))")  // original URL request
            print("\(String(describing: response.request?.allHTTPHeaderFields))")  // all HTTP Header Fields
//            print(String(data: (response.request?.httpBody)!, encoding: .utf8)!)  // httpBody
            print("\(String(describing: response.response))") // HTTP URL response
            print("\(String(describing: response.data))")     // server data
            print("\(response.result)")   // result of response serialization
            print("\(String(describing: response.result.value))")   // result of response serialization
            
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                print("JSON: \(json)")
                SVProgressHUD.dismiss()
                if let resultArray = json["data"].array {
                    self.arrayInsta.removeAll()
                    for item in resultArray {
                        self.arrayInsta.append(instaClass(json: item))
                    }
                    self.tableView.reloadData()
                }
            } else {
                
            }
        }
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInsta.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let label = cell?.viewWithTag(1000) as! UILabel
        label.text = arrayInsta[indexPath.row].fullName
        
        let imageview = cell?.viewWithTag(1001) as! UIImageView
        imageview.sd_setImage(with: URL(string: arrayInsta[indexPath.row].imageUrl ), completed: nil)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 274.0
    }

}


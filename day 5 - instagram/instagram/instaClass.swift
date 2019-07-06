//
//  instaClass.swift
//  instagram
//
//  Created by Olzhas Akhmetov on 1/30/18.
//  Copyright © 2018 Olzhas Akhmetov. All rights reserved.
//

import Foundation
import SwiftyJSON

class instaClass {
    var fullName:String = ""
    var imageUrl:String = ""
    
    init(){}
    
    init(json: JSON) {
        if let temp = json["user"]["full_name"].string {
            self.fullName = temp
        }
        if let temp = json["images"]["standard_resolution"]["url"].string {
            self.imageUrl = temp
        }
        
    }
}

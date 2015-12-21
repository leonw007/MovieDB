//
//  Actor.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import Foundation
import Alamofire

class Actor {
    
    var id: String?
    var name: String?
    var birthday: String?
    var birthCity: String?
    var popularity: String?
    var profileUrl: String?

    
    func parseJson(json: JSON) {
        
        if let result = json as JSON?{
            self.name = result["name"].stringValue
            self.birthday = result["birthday"].stringValue
            self.birthCity = result["birthcity"].stringValue
            self.popularity = result["popularity"].stringValue
            self.profileUrl = result["homepage"].stringValue
            
        }
    }
    
    
    

}


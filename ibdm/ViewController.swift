//
//  ViewController.swift
//  ibdm
//
//  Created by Chen Wang on 12/19/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var baseUrl:String = "http://ec2-52-91-4-187.compute-1.amazonaws.com/get"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, baseUrl, parameters: ["university": "jhu", "time": "winter"])
            .responseJSON { response in

                print(response.result.value)

        }
        
    }
    
    
    
    
    

}


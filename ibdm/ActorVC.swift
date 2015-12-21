//
//  ActorVC.swift
//  ibdm
//
//  Created by Chen Wang on 12/21/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class ActorVC: UIViewController {

    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var birthCit: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    var id: String?
    var actor = Actor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadInfo(id!) { () -> () in
            self.updateView()
        }
        
    }
    
    
    func updateView(){
        Alamofire.request(.GET, "\(actor.profileUrl!)").validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
            if err == nil {
                if data != nil {
                    let img = UIImage(data: data!)
                    print("rul is th \(img)")
                    self.background.image = img
                    self.profile.image = img
                }
            }
        })
        
        self.name.text = actor.name
        self.birthday.text = actor.birthday
        self.birthCit.text = actor.birthCity
        self.popularity.text = actor.popularity
        
    }
    
    
    
    //MARK: - Parsing Json data from server
    func downloadInfo(id: String, completed: DownloadComplete) {
        
        let parameters = ["id": id]
        
        Alamofire.request(.GET, "http://ec2-52-91-4-187.compute-1.amazonaws.com/get/actor.php", parameters: parameters)
            .responseJSON { response in
                
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    
                    let item = JSON(response.result.value!)
                    self.actor.parseJson(item["data"]["actor"])
                    completed()
                }
                
        }
    }
    

    @IBAction func backBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

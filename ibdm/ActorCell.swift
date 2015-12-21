//
//  ActorCell.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class ActorCell: UICollectionViewCell {
    

    @IBOutlet weak var actorAvatar: UIImageView!
    
    @IBOutlet weak var actorName: UILabel!
    
    
    
    // after we get the information about a movie, we use this function to update the cell
    func updateCell(actor: Actor) {

        actorName.text = actor.name
        
        // fetch image from the url
        Alamofire.request(.GET, "\(actor.profile!)").validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
            if err == nil {
                if data != nil {
                    let img = UIImage(data: data!)
                    self.actorAvatar.image = img
                    
                }
            }
        })
        
        
    }
    
    
}

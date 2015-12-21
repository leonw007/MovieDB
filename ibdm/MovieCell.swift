//
//  MovieCell.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImg: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var runningTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateCell(movie: Movie) {
        
        Alamofire.request(.GET, "\(apiUrlBase)\(movie.poster_url!)").validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
            if err == nil {
                if data != nil {
                    let img = UIImage(data: data!)
                    self.posterImg.image = img
                
                }
            }
        })
        
    
    }

    
    
}

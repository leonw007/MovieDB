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

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var posterImg: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var runningTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // after we get the information about a movie, we use this function to update the cell
    func updateCell(movie: Movie) {
        self.title.text = movie.title!
        self.popularity.text = movie.popularity!
        self.rating.text = movie.rating!
        self.runningTime.text = movie.runtime!
        

        // fetch image from the url
        Alamofire.request(.GET, "\(movie.poster_url!)").validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
            if err == nil {
                if data != nil {
                    let img = UIImage(data: data!)
                    print("rul is th \(img)")
                    self.posterImg.image = img
                    self.background.image = img
                
                }
            }
        })
        
    
    }

    
    
}

//
//  Movie.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import Foundation
import Alamofire


class Movie {
    
    var id: String?
    var imdb_id: String?
    var title: String?
    var poster_url: String?
    var language: String?
    var popularity: String?
    var year: String?
    var runtime: String?
    var overView: String?
    var rating: String?
    var voteCount: String?
    
    
    /// parseJson content for user
    func parseJson(json: JSON) {
        
        if let result = json as JSON?{
            self.poster_url = result["poster"].stringValue
            self.title = result["title"].stringValue
            self.language = result["language"].stringValue
            self.popularity = result["popularity"].stringValue

            self.year = result["year"].stringValue
            self.runtime = result["running_time"].stringValue
            self.overView = result["overview"].stringValue
            self.rating = result["vote_average"].stringValue
            self.voteCount = result["vote_count"].stringValue
        }
    }

    
    
    


}

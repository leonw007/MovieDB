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
    var actors: [Actor]? = [Actor]()
    
    
    /// parseJson content for user
    func parseJson(json: JSON) {
        
        if let result = json as JSON?{
            self.poster_url = result["poster"].stringValue
            self.title = result["title"].stringValue
            self.language = result["language"].stringValue
            var temp = Double(result["popularity"].stringValue)
            self.popularity = String( Double(round(100*temp!)/100))
 
            self.year = result["year"].stringValue
            self.runtime = "\(result["running_time"].stringValue) min"
            self.overView = result["overview"].stringValue
            self.rating = result["vote_average"].stringValue
            self.voteCount = result["vote_count"].stringValue
            
            for item in result["actors"].arrayValue {
                let actor = Actor()
                actor.id = item["actor_id"].stringValue
                actor.name = item["name"].stringValue
                actor.profileUrl = item["profile_url"].stringValue
                actors!.append(actor)

            }
            
        }
    }

    
    
    


}

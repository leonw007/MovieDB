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
    var popularity: Double?
    var year: Int?
    var runtime: Int?
    var overView: String?
    var rating: Double?
    var voteCount: Int?
    
    
    func downloadInfo(id: String, completed: DownloadComplete) {
        
        let parameters = ["id": id]
        
        
        Alamofire.request(.GET, "\(serverUrlBase)/get", parameters: parameters)
            .responseJSON { response in
                
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.parseJson( JSON(response.result.value!))
                    completed()
                    
                }
                
        }
    }
    
    
    /// parseJson content for user
    func parseJson(json: JSON) {
        
        if let result = json as JSON?{
            self.poster_url = result["poster_url"].stringValue
            self.title = result["title"].stringValue
            self.language = result["language"].stringValue
            self.popularity = result["popularity"].doubleValue

            self.year = result["year"].intValue
            self.runtime = result["runtime"].intValue
            self.overView = result["overView"].stringValue
            self.rating = result["rating"].doubleValue
            self.voteCount = result["voteCount"].intValue
        }
    }

    
    
    


}

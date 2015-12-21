//
//  ListVC.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    var movieForDetail: Movie?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.dataSource = self
        tableView.delegate = self

        downloadInfo("1" ) { () -> () in
            
            self.tableView.reloadData()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailMovie" {
            if let movieDetailVC  = segue.destinationViewController as? MovieDetailVC {
                movieDetailVC.movie = movieForDetail
            }
        }
    }
    
    //MARK: - Parsing Json data from server
    func downloadInfo(id: String, completed: DownloadComplete) {

        let parameters = ["id": id]
        
        Alamofire.request(.GET, "http://ec2-52-91-4-187.compute-1.amazonaws.com/get/movielist.php", parameters: parameters)
            .responseJSON { response in

                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    print("resut is \(response.result)")
                    self.parseJSON(JSON(response.result.value!))
                    completed()
                    
                }
                
        }
    }
    
    func parseJSON(json: JSON) {
        self.movies.removeAll()
        for result in json["data"]["movies"].arrayValue {
            let movie = Movie()
            movie.parseJson(result)
            movies.append(movie)
        
        }

    }
    
    
    
    //MARK: - Delegation methods
    //return how many sections we need
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //return how many rows we need
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    ///This function set where to go when selecting a row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let indexPath = tableView.indexPathForSelectedRow!
        
        self.movieForDetail = movies[indexPath.row]
        
        
        print("poster \(movieForDetail?.poster_url!)")
        self.performSegueWithIdentifier("showDetailMovie", sender: self)
    }
    
    
    //what to show in each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.updateCell(movie)
            return cell
        } else {
            let cell = MovieCell()
            return cell
        }
        
    }

}

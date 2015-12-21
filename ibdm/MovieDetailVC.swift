//
//  MovieDetailVC.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailVC: UIViewController,  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movie: Movie?
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var runningTime: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        updateView()
    }
    
    
    
    //MARK: - VIEW control
    func updateView() {
        
        print("detail url \(movie!.poster_url!)")
        // fetch image from the url
        Alamofire.request(.GET, "\(movie!.poster_url!)").validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
            if err == nil {
                if data != nil {
                    let img = UIImage(data: data!)
                    print("rul is th \(img)")
                    self.poster.image = img
                    self.background.image = img
                }
            }
        })
        
        
        overView.text = movie?.overView
        rating.text = movie?.rating
        popularity.text = movie?.popularity
        language.text = movie?.language
        year.text = movie?.year
        runningTime.text = movie?.runtime
        voteCount.text = movie?.voteCount
    
    }
    
    
    
    
    //MARK: - Delegation methods
    //These methods make the collection view cells actually show
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        
        let actor = movie?.actors![indexPath.row]
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ActorCell", forIndexPath: indexPath) as? ActorCell {
            cell.updateCell(actor!)
            return cell
        } else {
            let cell = ActorCell()
            return cell
        }

    }
    
    //do things when you select a cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
//        let poke: Pokemon!
//        
//        if inSearchMode {
//            poke = filteredPokemon[indexPath.row]
//        } else {
//            poke = pokemons[indexPath.row]
//        }
//        
//        self.performSegueWithIdentifier("PokemonDetailVC", sender: poke)
        
        
    }
    
    //number of itmes in one section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count \(movie?.actors?.debugDescription)")
        return (movie?.actors?.count)!
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    @IBAction func backBtn(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}

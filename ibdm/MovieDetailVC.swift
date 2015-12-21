//
//  MovieDetailVC.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController,  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    //MARK: - Delegation methods
    //These methods make the collection view cells actually show
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCellWithReuseIdentifier("ActorCell", forIndexPath: indexPath)
        
        return cell

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
//        
//        if inSearchMode {
//            return filteredPokemon.count
//        } else {
//            return pokemons.count
//        }
        return 5
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    


}

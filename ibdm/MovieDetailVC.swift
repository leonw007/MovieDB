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

        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Delegation methods
    //These methods make the collection view cells actually show
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCellWithReuseIdentifier("ActorCell", forIndexPath: indexPath)
        
        return cell
//        
//        //if it can grab a pokecell successfully, return it.
//        //important for dequeue: because two much (718) data in queue at the same time would crash the app
//        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
//            
//            
//            let pokemon: Pokemon!
//            
//            if inSearchMode {
//                pokemon = filteredPokemon[indexPath.row]
//            } else {
//                pokemon = pokemons[indexPath.row]
//            }
//            
//            
//            
//            cell.configCell(pokemon)
//            
//            return cell
//        } else {
        
//        }
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
    
//    
//    //set the size of grid
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSizeMake(105, 105)
//    }


}

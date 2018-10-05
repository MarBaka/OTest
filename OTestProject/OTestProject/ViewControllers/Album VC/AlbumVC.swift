//
//  testVC.swift
//  OTestProject
//
//  Created by Marat on 11.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

class AlbumVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var colView: UICollectionView!
    
    let cellInset = 15.0 as CGFloat
    
    var randomNumberOfElementsOnScreen = Int(arc4random_uniform(14)) + 1
    var randomIndexesOfElementsInAlbumArray : [Int] = []
    var albumArray : [Album] = []
    
    var photosArray : [[Photo]] = []
    var albumIdsUsed : [Int] = []
    
    override func viewDidLoad() {
        ServerManager.server.getAlbums(completion: gettingAlbums, error: printError)
        
        colView.delegate = self
        colView.dataSource = self
        colView.contentInset = UIEdgeInsets(top: cellInset, left: cellInset, bottom: cellInset, right: cellInset)
        
        while randomNumberOfElementsOnScreen < 10 {
            randomNumberOfElementsOnScreen = Int(arc4random_uniform(16))
        }
    }
    
    func printError(error : String) {
        print(error)
    }
    
    func getPhotos() {
        
        while randomIndexesOfElementsInAlbumArray.count < randomNumberOfElementsOnScreen {
            let randomIndex = Int(arc4random_uniform(UInt32(albumArray.count)))
            if !(randomIndexesOfElementsInAlbumArray.contains(randomIndex)) {
                randomIndexesOfElementsInAlbumArray.append(randomIndex)
            }
        }
        
        for index in randomIndexesOfElementsInAlbumArray {
            let albumId = albumArray[index].id!
            ServerManager.server.getPhotos(albumId: albumId, completion: gettingPhotos, error: printError)
        }
    }
    
    func gettingPhotos(result : [Photo]) {
        photosArray.append(result)
        print(result[Int(arc4random_uniform(UInt32(result.count)))].title!)
        colView.reloadData()
    }
    
    func gettingAlbums(result : [Album]) {
        
        var objectsMassive : [Album] = []
        
        while objectsMassive.count < randomNumberOfElementsOnScreen {
            let randomIndexOfElement = Int(arc4random_uniform(UInt32(result.count)))
            if !(containsInAlbumArray(array: objectsMassive, object: result[randomIndexOfElement])){
                objectsMassive.append(result[randomIndexOfElement])
            }
        }
        self.albumArray = objectsMassive
        colView.reloadData()
        getPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCollectionViewCell
        if albumArray.count != 0 {
            cell.setData(title: self.albumArray[indexPath.item].title!, imgPath: nil)
        }
        if photosArray.count != 0 {
            cell.setData(title: self.albumArray[indexPath.item].title!, imgPath: self.photosArray.last![Int(arc4random_uniform(UInt32(photosArray.count)))].url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomNumberOfElementsOnScreen
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoVC") as! PhotoViewController
        vc.photoArray = self.photosArray[indexPath.item]
        self.navigationController?.show(vc, sender: self)
    }

    func containsInAlbumArray (array : [Album], object : Album) -> Bool {
        
        for album in array {
            if album.id == object.id {
                return true
            }
        }
        return false
    }
}

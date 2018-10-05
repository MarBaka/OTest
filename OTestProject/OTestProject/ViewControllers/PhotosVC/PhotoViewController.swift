//
//  PhotoViewController.swift
//  OTestProject
//
//  Created by Marat on 28.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var colView : UICollectionView!
    
    var photoArray: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colView.dataSource = self
        colView.delegate = self
        
        colView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        colView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        if photoArray.count != 0 {
            cell.setData(data: photoArray[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
}

//
//  AlbumCollectionViewCell.swift
//  OTestProject
//
//  Created by Marat on 16.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher
class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imgView : UIImageView!
    
    func setData(title: String, imgPath : String?) {
        if imgPath != nil {
            imgView.kf.setImage(with: URL(string: imgPath!))
        }
        titleLabel.text = title
    }
    
}

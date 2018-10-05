//
//  PhotoCollectionViewCell.swift
//  OTestProject
//
//  Created by Marat on 28.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imgView : UIImageView!
    
    func setData (data : Photo) {
        titleLabel.text = data.title!
        imgView.kf.setImage(with: URL(string: data.url!))
    }
}

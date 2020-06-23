//
//  PhotoCollectionViewCell.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

}

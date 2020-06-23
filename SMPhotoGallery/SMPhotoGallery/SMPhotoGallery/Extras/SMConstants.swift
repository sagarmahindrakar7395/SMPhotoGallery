//
//  SMConstants.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import Foundation
import UIKit

struct constants
{
    struct dimenssions
    {
        //collection view dimenssions
        static let gridCellSize = CGSize(width: 180, height: 200)
        static let minimumLineSpacing = CGFloat(10)
    }

    //String constants
    struct strings
    {
        static let formatKey = "format"
        static let widthkay = "width"
        static let heightkey = "height"
        static let filenamekey = "filename"
        static let photoIDkey = "id"
        static let authorkey = "author"
        static let author_urlkey = "author_url"
        static let post_urlkey = "post_url"

        static let cellNibName = "PhotoCollectionViewCell"
    }

    //String URL constants
    struct stringURL
    {
        static let APIForCollectionViewData = "https://picsum.photos/list"
        static let APIForCollectionViewImage = "https://picsum.photos/300/300?image="
    }

    //Error contsants
    struct errors
    {
        static let networkError = "something went wrong"
    }

}


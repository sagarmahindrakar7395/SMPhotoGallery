//
//  PhotoGalleryDataModel.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import Foundation


class PhotoGalleryDataModel:Codable
{
    var format:String?
    var width:Int?
    var height:Int?
    var filename:String?
    var photoID:Int?
    var author:String?
    var author_url:String?
    var post_url:String?

    init(){}
}

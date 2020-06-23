//
//  ApiController.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import Foundation

class ApiController
{
    /**
    Get Photos API will talk to network manager and passes success and failure clousers.
    - Parameter success: clouser that has the response in dictionary form.
    - Parameter failure: clouser which gives error in string.
    */
    func getPhotos(success:@escaping(Any) -> Void, failure:@escaping(String) -> Void)
    {
        NetworkManger.sharedInstance.getData(params:[:], stringURL:constants.stringURL.APIForCollectionViewData, success: success, failure: failure)
    }

    /**
    Get Photos API will talk to network manager and passes success and failure clousers.
    - Parameter imageID: ImageID for geting the appropriate image
    */
    func getImege(imageID:Int, success:@escaping(Any) -> Void, failure:@escaping(String) -> Void)
    {
        NetworkManger.sharedInstance.getImageData(params:[:], stringURL:constants.stringURL.APIForCollectionViewImage + String(imageID), success: success, failure: failure)
    }
}

//
//  ViewController.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: GridViewController
{

    @IBOutlet weak var collectionView: UICollectionView!

    //MARK: Lifecycle methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchPhotosData()
        setupCollectionView()
    }

    //MARK: Private methods
    private func setupCollectionView()
    {
        //Assign cell to collectionView
        let cellNib = UINib(nibName: constants.strings.cellNibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier:constants.strings.cellNibName)
        let dashboardLayout = UICollectionViewFlowLayout()
        dashboardLayout.scrollDirection = .vertical
        dashboardLayout.minimumLineSpacing = constants.dimenssions.minimumLineSpacing
        collectionView.collectionViewLayout = dashboardLayout
    }

    private func fetchPhotosData()
    {
        //Get API call
        let apiController = ApiController()
        apiController.getPhotos(success: { response in
            if let data = response as? [[String:Any]]
            {
                for model in data
                {
                    let photoGalleryDataModel = PhotoGalleryDataModel()
                    photoGalleryDataModel.format = model[constants.strings.formatKey] as? String
                    photoGalleryDataModel.width = model[constants.strings.widthkay] as? Int
                    photoGalleryDataModel.height = model[constants.strings.heightkey] as? Int
                    photoGalleryDataModel.photoID = model[constants.strings.photoIDkey] as? Int
                    photoGalleryDataModel.author = model[constants.strings.authorkey] as? String
                    photoGalleryDataModel.author_url = model[constants.strings.author_urlkey] as? String
                    photoGalleryDataModel.post_url = model[constants.strings.post_urlkey] as? String
                    photoGalleryDataModel.filename = model[constants.strings.filenamekey] as? String
                    self.photoGalleryDataModelArray.append(photoGalleryDataModel)
                }
                self.collectionView.reloadData()
            }

        }, failure: { error in
           print(error)
        })
    }
}


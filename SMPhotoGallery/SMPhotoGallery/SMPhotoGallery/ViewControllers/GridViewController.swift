//
//  GridViewController.swift
//  SMPhotoGallery
//
//  Created by Sagar Mahindrakar on 22/06/20.
//  Copyright © 2020 SagarMahindrakar. All rights reserved.
//

import UIKit

class GridViewController: UIViewController
{

    public var photoGalleryDataModelArray = [PhotoGalleryDataModel]()

    //MARK: Lifecycle methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension GridViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photoGalleryDataModelArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:constants.strings.cellNibName, for: indexPath) as! PhotoCollectionViewCell

        if let author = self.photoGalleryDataModelArray[indexPath.item].author
        {
            cell.captionLabel.text = author
        }

        if let photoID = self.photoGalleryDataModelArray[indexPath.row].photoID
        {
            cell.imageView.image = UIImage(named: "cloud")
            ApiController().getImege(imageID: photoID, success: { image in
                if let data = image as? Data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageView.image = image
                    }
                }
            }) { error in
                print(error)
            }

        }
      return cell
    }

    //set collectionView dimenssions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return constants.dimenssions.gridCellSize
    }

}



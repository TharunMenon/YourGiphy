//
//  GifCollectionViewCell.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import UIKit

class GifCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gifImgVw: UIImageView!
    @IBOutlet weak var favouriteBtn: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favouriteBtn.addTarget(FavoritesVC(), action:#selector(FavoritesVC.favouriteBtntapped) , for: .touchUpInside)
        
    }

    func configureCell(favouriteGif:Favourites, indexPath:IndexPath) {
        let imageUrl = URL(string: favouriteGif.url!)
        gifImgVw.kf.setImage(with: imageUrl)
        favouriteBtn.indexPath = indexPath
        favouriteBtn.backgroundColor = UIColor.red
    }
    
    
}


//
//  GifTableViewCell.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import UIKit
import Kingfisher

class GifTableViewCell: UITableViewCell {
    @IBOutlet weak var gifImgVw: UIImageView!
    @IBOutlet weak var favouriteBtn: CustomButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        favouriteBtn.addTarget(HomeVC(), action:#selector(HomeVC.favouriteBtntapped) , for: .touchUpInside)
    }

    func configureCell(giphy:Giphy, indexPath:IndexPath) {
        let imageUrl = URL(string: giphy.url)
        gifImgVw.kf.setImage(with: imageUrl)
        favouriteBtn.indexPath = indexPath
        if giphy.isFavourite {
            favouriteBtn.backgroundColor = UIColor.red
        } else {
            favouriteBtn.backgroundColor = UIColor.lightGray
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


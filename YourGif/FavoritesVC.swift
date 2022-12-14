//
//  FavoritesVC.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
import Kingfisher

class FavoritesVC: UIViewController {
    @IBOutlet weak var favouritesCollectionVw: UICollectionView!
    var arrFavouriteImages = [Favourites]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavouritesFromDatabase()
    }
    
    
    func fetchFavouritesFromDatabase() {
        CoreDataManager.sharedInstance.fetchAllFavouritesFromDatabase { (arrFavouriteImages) in
            if let unwrappedArrFavouriteImages = arrFavouriteImages {
                self.arrFavouriteImages = unwrappedArrFavouriteImages
            }
            DispatchQueue.main.async {
                self.favouritesCollectionVw.reloadData()
            }
        }
    }
    
    
    @objc func favouriteBtntapped(_ sender: CustomButton) {
        
        UtilityMethods.showYesNoAlertFromVC(viewController: self, title: "Alert!", msg: "Are you sure to delete this image from favourites?") { (index) in
            if index == 0 {
                let favouriteGif = self.arrFavouriteImages[sender.indexPath.row]
                CoreDataManager.sharedInstance.deleteFavouriteFromDatabase(favourite: favouriteGif, completion: { (success) in
                    if success {
                        self.fetchFavouritesFromDatabase()
                    }
                })
            }
        }
    }
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = CGFloat((SCREEN_WIDTH/2) - 5)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFavouriteImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCollectionViewCell", for: indexPath) as? GifCollectionViewCell {
            cell.configureCell(favouriteGif: arrFavouriteImages[indexPath.row], indexPath: indexPath)
            
            return cell
        }
        return GifCollectionViewCell()
    }
    
}

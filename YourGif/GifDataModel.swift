//
//  GifDataModel.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import Foundation
class Giphy {
    public private(set) var id:String!
    public private(set) var url:String!
    public private(set) var isFavourite:Bool!
    
    init(id:String, url:String, isFavourite:Bool) {
        self.id = id
        self.url = url
        self.isFavourite = isFavourite
    }
    
    func setFavouriteValue(isFavourite:Bool) {
        self.isFavourite = isFavourite
    }
}

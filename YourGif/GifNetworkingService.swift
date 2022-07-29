//
//  GifNetworkingService.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class GifApiService {
    static let sharedInstance = GifApiService()
    
    func downloadTrendingGifs(withOffset offset:Int, completion:@escaping CompletionHandlerAPI) {
      
    //For testing local data
        
      /* if let path = Bundle.main.path(forResource: "TrendingGifMockFile", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                self.parseGifData(data: data, completion: completion)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }*/
        
        
       AF.request(URL_TRENDING(offset), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (responseJSON) in
            
            guard let data = responseJSON.data else {
                return}
            do {
                self.parseGifData(data: data, completion: completion)
            } catch {
                completion(nil)
            }
        })
    }
    
    
    func searchGifs(withOffset offset:Int,withSearchStr searchStr:String, completion:@escaping CompletionHandlerAPI) {
        
        AF.request(URL_SEARCH(searchStr, offset), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (responseJSON) in
            
            guard let data = responseJSON.data else {
                return}
            do {
                self.parseGifData(data: data, completion: completion)
            } catch {
                completion(nil)
            }
        })
    }
    
    func parseGifData(data:Data, completion:@escaping CompletionHandlerAPI) {
        let json = try! JSON(data:data)
        let arrData = json["data"].arrayValue
        var arrGiphyImages = [Giphy]()
        
        if arrData.count > 0 {
            for item in arrData {
                let id = item["id"].stringValue
                
                let fetchedFavourite = CoreDataManager.sharedInstance.fetchGiphyFromDatabaseWithId(id: id)
                var isFavourite = false
                if let favourite = fetchedFavourite {
                    isFavourite = true;
                }
                
                guard let dictImages = item["images"].dictionary else {return}
                guard let image = dictImages["fixed_height"]?.dictionary else {return}
                guard let imageUrl = image["url"]?.stringValue else {return}
                arrGiphyImages.append(Giphy(id: id, url: imageUrl, isFavourite: isFavourite))
            }
        }
        completion(arrGiphyImages)
    }
    
}

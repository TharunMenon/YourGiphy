//
//  GifConstants.swift
//  YourGif
//
//  Created by Tharun Menon on 27/07/22.
//

import Foundation
import UIKit
//URL Constants
let API_KEY_GIPHY = "gCblrjYnZgRzA4gjMjc7i8VwP3SpGvMi"
let BASE_URL = "https://api.giphy.com/v1/"

//Giphy Search URL
let URL_SEARCH:(String,Int) -> String = {searchString, offset in return String(format: "%@%@%@%@%@%@%d%@", BASE_URL, "gifs/search?api_key=", API_KEY_GIPHY,"&q=",searchString,"&limit=25&offset=", offset, "&rating=G&lang=en")}

//Giphy Trending URL
let URL_TRENDING:(Int) -> String = {offset in return String(format: "%@%@%@%@%d%@", BASE_URL, "gifs/trending?api_key=", API_KEY_GIPHY,"&limit=25&offset=",offset,"&rating=G&lang=en")}

//Headers
let HEADER = [
    "Content-Type":"application/json; charset=utf-8",
]

// Completion Handlers
typealias CompletionHandlerAPI = (_ arrGifs:[Giphy]?) -> ()
typealias CompletionHandlerDatabase = (_ Success: Bool) -> ()
typealias CompletionHandlerDatabaseWithFavourites = (_ arrfavourites:[Favourites]?) -> ()

// AppDelegate
let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate

//Other Constants

let SCREEN_WIDTH = UIScreen.main.bounds.width
let loadingViewBackgoundColour = UIColor(red: 0/255, green: 51/255, blue: 95/255, alpha: 1)

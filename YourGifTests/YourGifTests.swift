//
//  YourGifTests.swift
//  YourGifTests

import XCTest
@testable import YourGif

class YourGifTests: XCTestCase {
    let sampleGifFileName = "TrendingGifMockFile"
    let sharedInstance = GifApiService()

    func testGifParsedCorrectly() {
        let data = readMockGifData()
        
    }
    //Convert to readable data
    private func readMockGifData() -> Data {
        return Data()
    }
}

   

//
//  ViewController.swift
//  intermediate_IOS-proj1
//
//  Created by MakeSchool on 10/14/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MovieManager {
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    
    var movieArray = [movie]()
    
    func request() {
        
        //let newMovie = movie()
        
        Alamofire.request(urlString).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let movieData = JSON(value)
               //     print(movieData)
                    print("------------")
                     print("------------")
                     print("------------")
              //      let movieTitle = movieData["feed"]["entry"][0]["im:name"]["label"]
                    
                    var entries = movieData["feed"]["entry"].array!
                    for entry in entries {
                        
                        let movieTitle = entry["im:name"]["label"].string!
                        self.movieArray.append(movie(movieTitle: movieTitle))
                    }
                    print(self.movieArray)
                }
            case .failure :
                print("awe man!!!!")
            }
        }
    }
    
    
    
}


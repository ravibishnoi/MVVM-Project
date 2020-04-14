//
//  MovieModel.swift
//  MvvmProject
//
//  Created by AshutoshD on 10/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class MovieModel: Decodable {
    var artistName : String?
    var trackName : String?
    init(artistName:String, trackName:String ) {
        self.artistName = artistName
        self.trackName = trackName
    }
    
}

class ResultsModel:Decodable {
    
    var results = [MovieModel]()
    init(results: [MovieModel]) {
        self.results = results
    }
}

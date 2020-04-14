//
//  MovieViewModel.swift
//  MvvmProject
//
//  Created by AshutoshD on 10/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {

    var artistName : String?
    var trackName : String?
    
    // D I
    
    init(movie:MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}

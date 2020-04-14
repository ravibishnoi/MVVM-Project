//
//  Service.swift
//  MvvmProject
//
//  Created by AshutoshD on 10/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class Service: NSObject {
    
    static let shareInstance = Service()

    func getAllMovieData(completion: @escaping([MovieModel]?, Error?)-> ()) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ (data, respose,error) in
            if let err = error {
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else{return}
                do {
                    var arrMovieData = [MovieModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for movie in results.results{
                        arrMovieData.append(MovieModel(artistName: movie.artistName!, trackName: movie.trackName!))
                    }
                    completion(arrMovieData,nil)
                    print(results)
                }catch let jsonErr{
                    print("json error \(jsonErr.localizedDescription)")
                }
            }
            
        }.resume()
    }
}

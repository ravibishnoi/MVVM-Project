//
//  ViewController.swift
//  MvvmProject
//
//  Created by AshutoshD on 10/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tblView : UITableView!
    var arrMovieVM = [MovieViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tblView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: "cell")
      getData()
    }
    
    func getData(){
        Service.shareInstance.getAllMovieData { (movies, error) in
            if(error==nil){
                print(movies)
                self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0) }) ?? []
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
        }
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let MVM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = MVM.artistName ?? ""
        cell.detailTextLabel?.text = MVM.trackName ?? ""
        return cell
    }
    
    
}

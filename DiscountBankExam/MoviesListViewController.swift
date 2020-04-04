//
//  MoviesListViewController.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit
import MBProgressHUD

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var genreID: String?
    
    var viewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.genreID = self.genreID ?? ""
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel.delegate = self
        self.getData()
    }
    
    func getData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.viewModel.getData()
    }
    
    func moreData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.viewModel.moreData()
    }
    
}

extension MoviesListViewController: MoviesListViewModelDelegate {
    func didfinish(succsess: Bool) {
        MBProgressHUD.hide(for: self.view, animated: true)
        if succsess {
            tableView.reloadData()
        } else {
            let action = UIAlertAction(title: "Try again", style: .default, handler: { (action) in
                self.getData()
            })
            Alerts.showAlert(vc: self, action: action)
        }
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        let isFromGenre = self.viewModel.isFromGenre(index: indexPath.row)
        cell.isFromGenre = isFromGenre
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.count - 1 {
            self.moreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.viewModel.getMovie(index: indexPath.row)
        let desViewController = storyboard!.instantiateViewController(withIdentifier: "movieViewController") as! MovieViewController
        desViewController.movie = movie
        self.navigationController?.pushViewController(desViewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  ViewController.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = GenreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.collectionView.bounds.width, height: 50)
        }
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundView = UIImageView(image: UIImage(named: "131249-dark-grey-low-poly-abstract-background-design-vector.jpg"))
        self.viewModel.delegate = self
        self.getData()
    }
    
    func getData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        viewModel.getGenres()
    }
}

extension ViewController: GenreViewModelDelegate {
    func didfinish(succsess: Bool) {
        MBProgressHUD.hide(for: self.view, animated: true)
        if succsess {
            self.collectionView.reloadData()
        } else {
          let action = UIAlertAction(title: "Try again", style: .default, handler: { (action) in
                self.getData()
            })
            Alerts.showAlert(vc: self, action: action)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.reuseIdentifier, for: indexPath) as? GenreCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        let desViewController = storyboard!.instantiateViewController(withIdentifier: "MovieVC") as! MoviesListViewController
        desViewController.genreID = cellViewModel?.id
        self.navigationController?.pushViewController(desViewController, animated: true)
    }
}

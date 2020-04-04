//
//  MovieViewController.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 04/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit
import SDWebImage

class MovieViewController: UIViewController {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var overViewTextView: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movie: Movie?
    var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLbl.textColor = .orange
        self.populateParams()
        self.viewModel.delegate = self
    }
    
    func populateParams() {
        if let movie = self.movie {
            self.titleLbl.text = movie.original_title
            self.overViewTextView.text = movie.overview
            self.dateLbl.text = movie.release_date
            let url = "https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")"
            imageView.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
    
    @IBAction func watchTrailerAction(_ sender: Any) {
        if let movie = self.movie, let id = movie.id {
            self.viewModel.getVideo(id: String(id))
        }
    }
}

extension MovieViewController: MovieViewModelDelegate {
    func didfinish(succsess: Bool, link: String?) {
        if succsess {
            let url = "https://www.youtube.com/watch?v=\(link ?? "")"
            let desViewController = storyboard!.instantiateViewController(withIdentifier: "WBViewController") as! WKwebViewController
            desViewController.url = url
            self.navigationController?.pushViewController(desViewController, animated: true)
        } else {
            let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                  //
              })
              Alerts.showAlert(vc: self, action: action)
        }
    }    
}

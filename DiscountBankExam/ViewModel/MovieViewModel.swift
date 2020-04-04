//
//  MovieViewModel.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 04/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

protocol MovieViewModelDelegate: class {
    func didfinish(succsess: Bool, link: String?)
}

class MovieViewModel {
    
    weak var delegate: MovieViewModelDelegate?
    
    var networking =  Networking()
    
    var movie = Movie()
    
    func getVideo(id: String) {
        self.networking.preformNetwokTask(endPoint: TheMoviedbApi.videos(id), type: Video.self, success: { [weak self] (response) in
            print(response)
            if let video = response.results {
                let link = video.first?.key
                self?.delegate?.didfinish(succsess: true, link: link)
            } else {
                self?.delegate?.didfinish(succsess: false, link: nil)
            }
        }) {
            self.delegate?.didfinish(succsess: false, link: nil)
        }
    }

}

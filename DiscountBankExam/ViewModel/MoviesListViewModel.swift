//
//  MoviesListViewModel.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

protocol MoviesListViewModelDelegate: class {
    func didfinish(succsess: Bool)
}

class MoviesListViewModel {
    
    var networking =  Networking()
    var moviesModels = [Movie]()
    var genreID = String()
    var page = 1
    
    weak var delegate: MoviesListViewModelDelegate?
    
    func moreData() {
        if page <= 5 {
            self.page += 1
            self.getData()
        }
    }
    
    func getData() {
        self.networking.preformNetwokTask(endPoint: TheMoviedbApi.popular("\(self.page)"), type: Popular.self, success: { [weak self] (response) in
            if let movies = response.results {
                self?.moviesModels += movies
                self?.delegate?.didfinish(succsess: true)
            } else {
                self?.delegate?.didfinish(succsess: false)
            }
        }) {
            self.delegate?.didfinish(succsess: false)
        }
    }
    
    var count: Int {
        return moviesModels.count
    }
    
    public func getMovie(index: Int) -> Movie {
        return moviesModels[index]
    }
    
    public func cellViewModel(index: Int) -> MoviewTabelViewCellModel? {
        let moviewTabelViewCellModel = MoviewTabelViewCellModel(movie: self.moviesModels[index])
        return moviewTabelViewCellModel
    }
    
    public func isFromGenre(index: Int) -> Bool {
        let movie = self.moviesModels[index]
        if let ids = movie.genre_ids {
            if ids.contains(Int(self.genreID) ?? 0) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}

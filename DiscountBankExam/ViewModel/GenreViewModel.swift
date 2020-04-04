//
//  GenreViewModel.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

protocol GenreViewModelDelegate: class {
    func didfinish(succsess: Bool)
}

class GenreViewModel {
    
    var networking =  Networking()
    
    var genresModels = [Genres]()
    
    weak var delegate: GenreViewModelDelegate?
    
    func getGenres() {
        self.networking.preformNetwokTask(endPoint: TheMoviedbApi.genre, type: Genre.self, success: { [weak self] (response) in
            print(response)
            if let genres = response.genres {
                self?.genresModels = genres
                self?.delegate?.didfinish(succsess: true)
            } else {
                self?.delegate?.didfinish(succsess: false)
            }
        }) {
            self.delegate?.didfinish(succsess: false)
        }
    }
    
    var count: Int {
        return genresModels.count
    }
    
    public func cellViewModel(index: Int) -> GenreCollectionViewCellModel? {
        
        let genreCollectionViewCellModel = GenreCollectionViewCellModel(genre: genresModels[index])
        return genreCollectionViewCellModel
        
    }
}

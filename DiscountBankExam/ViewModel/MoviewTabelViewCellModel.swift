//
//  MoviewTabelViewCellModel.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

class MoviewTabelViewCellModel {
    
    private let movie: Movie
    
    init (movie: Movie) {
        self.movie = movie
    }
    
    var name: String? {
        return movie.original_title
    }
    
    var image: String? {
        return movie.poster_path
    }
    
    var overview: String? {
        return movie.overview
    }
    
    var date: String? {
        return movie.release_date
    }
    
    var genre: [Int]? {
        return movie.genre_ids
    }
}

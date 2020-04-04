//
//  GenreCollectionViewCellModel.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

class GenreCollectionViewCellModel {
    
    private let genre: Genres
    
    init (genre: Genres) {
        self.genre = genre
    }
    
    var name: String? {
        return genre.name
    }
    
    var id: String? {
        return ("\(genre.id ?? 0)")
    }
}

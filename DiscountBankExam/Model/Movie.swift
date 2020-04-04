//
//  Movie.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 01/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var original_title: String?
    var release_date: String?
    var overview: String?
    var poster_path: String?
    var genre_ids: [Int]?
    var id: Int?
}

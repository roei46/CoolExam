//
//  Video.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 04/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

struct Video: Codable {
    var results: [VideoOption]?
}

struct VideoOption: Codable  {
    var id: String?
    var key: String?
}

//
//  GenreCollectionViewCell.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gnreImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    public static let reuseIdentifier = "genreCell"

    
    public var viewModel: GenreCollectionViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLbl.text = viewModel.name
        }
    }
}

//
//  MovieTableViewCell.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var gnreImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    public static let reuseIdentifier = "movieCell"
    
    public var viewModel: MoviewTabelViewCellModel? {
         didSet {
             guard let viewModel = viewModel else { return }
             nameLbl.text = viewModel.name
            if let poster = viewModel.image {
            let url = "https://image.tmdb.org/t/p/w500/\(poster)"
                gnreImage.sd_setImage(with: URL(string: url), completed: nil)
            }
         }
     }
    
    public var isFromGenre: Bool? {
         didSet {
            guard let isFromGenre = isFromGenre else { return }
            if isFromGenre {
                nameLbl.textColor = .orange
            }
         }
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

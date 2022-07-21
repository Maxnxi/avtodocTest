//
//  NewsCell.swift
//  Collection-View-Layout-iOS13
//
//  Created by atikhonov on 02.04.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
        
    static let reuseIdentifier = "newsCell"
    
    func configure(newCellViewModel: NewsCellViewModel) {
        self.titleLabel.text = newCellViewModel.new.title
        self.descriptionLabel.text = newCellViewModel.new.newsDescription
        self.idLabel.text = newCellViewModel.new.id.description
        self.thumbailImageView.image = newCellViewModel.newThumbnail
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
    }

}

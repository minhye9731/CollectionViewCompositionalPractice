//
//  ImageViewCell.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//

import UIKit

class ImageViewCell: BaseCollectionViewCell {
    
    let likesCountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()
    
    let RandomImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    
    override func configure() {
        [RandomImageView, likesCountLabel].forEach {
            contentView.addSubview($0)
        }
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    override func setConstraints() {
        RandomImageView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        likesCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
        }
    }
}

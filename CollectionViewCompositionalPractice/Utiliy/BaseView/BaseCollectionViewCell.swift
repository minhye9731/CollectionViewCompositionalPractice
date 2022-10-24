//
//  BaseCollectionViewCell.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//

import UIKit
import SnapKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() { self.backgroundColor = .clear}
    func setConstraints() {}
}

//
//  ImageViewCell.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//

import UIKit

class ImageViewCell: BaseCollectionViewCell {
    
    // MARK: - UI 요소
    let likesCountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let RandomImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    // MARK: - UI 메서드
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
    
    func setData(data: RandomPhotoDTO) {
        
        self.likesCountLabel.text = "좋아요 수 : \(data.likes)"
        
        DispatchQueue.global().async {
            guard let url = URL(string: data.urls) else { return }
            let data = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
                self.RandomImageView.image = UIImage(data: data!)
            }
        }
        
        
        
    }
    
    
}

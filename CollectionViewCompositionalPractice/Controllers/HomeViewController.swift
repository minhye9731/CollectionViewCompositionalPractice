//
//  HomeViewController.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView! = nil
    
    var viewModel = UnsplashViewModel()
    private var dataSource: UICollectionViewDiffableDataSource<Section, RandomPhoto>!// = nil
    
    override func configure() {
        setNav()
        configureHierarchy()
        configureDataSource()
        
        viewModel.requestRandomPhoto()
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func bindData() {
        viewModel.randomPhotoList.bind { randomPhoto in
            var snapshot = NSDiffableDataSourceSnapshot<Section, RandomPhoto>()
            snapshot.appendSections([Section.main]) // 첫 번째 section이라는 말
//            snapshot.appendItems(randomPhoto.) // 통신해서 받는 radomImage의
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
    
    
    
}

// MARK: - two column 형태 잡기
extension HomeViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}



// MARK: - compositional layout
extension HomeViewController {
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<ImageViewCell, RandomPhoto> { cell, indexPath, itemIdentifier in
            
            cell.likesCountLabel.text = "좋아요 수 : \(itemIdentifier.likes)"
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.RandomImageView.image = UIImage(data: data!)
                }
            }
        }
        
//        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
//
//            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
//
//            return cell
//        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        
        
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(Array(0..<94))
//        dataSource.apply(snapshot, animatingDifferences: false)
    }
}



// MARK: - 기타
extension HomeViewController {
    
    func setNav() {
        self.navigationItem.title = "랜덤 이미지 얻기"
        self.navigationController?.navigationBar.tintColor = .blue
        let navibarAppearance = UINavigationBarAppearance()
        navibarAppearance.backgroundColor = .white
        navibarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        self.navigationItem.scrollEdgeAppearance = navibarAppearance
        self.navigationItem.standardAppearance = navibarAppearance
    }
    
}

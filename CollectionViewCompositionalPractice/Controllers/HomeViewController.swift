//
//  HomeViewController.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import UIKit

struct SettingList: Hashable {
    let id = UUID().uuidString
    let title: String
    let subTitle: String
}

class HomeViewController: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        return collectionView
    }()
    
    // 삭제예정
    var contents = [
        SettingList(title: "문의하기", subTitle: ""),
        SettingList(title: "리뷰쓰기", subTitle: ""),
        SettingList(title: "오픈소스 라이선스", subTitle: ""),
        SettingList(title: "버전", subTitle: "x.x.x")
    ]
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, SettingList>!
    
    override func loadView() {
        collectionView.collectionViewLayout = createLayout()
    }
    
    
    override func configure() {
        view.backgroundColor = .lightGray
        setNav()
        configureDataSource()
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    
}

// MARK: - compositional layout
extension HomeViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    private func configureDataSource() {
        
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, SettingList> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.subTitle
            content.textProperties.color = .black
            cell.contentConfiguration = content
            
            var background = UIBackgroundConfiguration.listPlainCell()
            background.backgroundColor = .white
            cell.backgroundConfiguration = background
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, SettingList>()
        snapshot.appendSections([0])
        snapshot.appendItems(contents)
        dataSource.apply(snapshot)
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

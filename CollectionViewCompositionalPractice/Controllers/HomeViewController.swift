//
//  HomeViewController.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
    
    enum Section {
        case main
    }

    var viewModel = UnsplashViewModel()
    let randomPhotoList = PublishSubject<[RandomPhoto]>()
    let disposeBag = DisposeBag()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, RandomPhoto>!
    var collectionView: UICollectionView! = nil
    
    override func configure() {
        setNav()
        configureHierarchy()
        configureDataSource()
        
        viewModel.randomPhotoListPublishSubject = randomPhotoList
        viewModel.requestRandomPhotoPublishSubject()
        
        bindData()
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func bindData() {
        
        // 차근차근 해보자.
        viewModel.randomPhotoListPublishSubject
            .subscribe { value in
                print("뷰컨 확인용 - \(value)")
                print("subscribe 확인용")
            }
            .disposed(by: disposeBag)
        
        
        
//        viewModel.randomPhotoList.bind { randomPhoto in
//            var snapshot = NSDiffableDataSourceSnapshot<Section, RandomPhoto>()
//            snapshot.appendSections([Section.main]) // 첫 번째 section이라는 말
////            snapshot.appendItems(randomPhoto.) // 통신해서 받는 radomImage의
//            self.dataSource.apply(snapshot, animatingDifferences: false)
//        }
        
        // 수정 후
        // 통신해서 받은 데이터를 이제 뷰에 넣어줌
//        viewModel.randomPhotoListBehaviorRelay // 함수가 아닌 BehaviorRelay 변수 데이터를 넣어줌
//            .withUnretained(self)
//            .bind { (vc, randomPhoto) in
//                var snapshot = NSDiffableDataSourceSnapshot<Section, RandomPhoto>()
//                snapshot.appendSections([.main]) // 첫 번째 section이라는 말
//                snapshot.appendItems(randomPhoto)
//                vc.dataSource.apply(snapshot)
//            }
//            .disposed(by: disposeBag) // relay는 수동으로 dispose 해주어야 함.
//
//        // 데이터를 통신시키는 거는 (별도 버튼이 없으니까) 바로 실행해줌
//        viewModel.requestRandomPhotoBehaviorRelay() // 이게 왜!! 실행이 안될까!!
        
        // (현재) 실행결과 : behavior이라서 넣어준 초기값 이미지만 보이고, 통신한 결과는 안보임..
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
            
            cell.backgroundColor = .orange
//            cell.likesCountLabel.text = "좋아요 수 : 100"
            
            cell.setData(data: itemIdentifier)
            
//            cell.likesCountLabel.text = "좋아요 수 : \(itemIdentifier.likes)"
//
//            DispatchQueue.global().async {
//                let url = URL(string: itemIdentifier.urls.thumb)!
//                let data = try? Data(contentsOf: url)
//
//                DispatchQueue.main.async {
//                    cell.RandomImageView.image = UIImage(data: data!)
//                }
//            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, RandomPhoto>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
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

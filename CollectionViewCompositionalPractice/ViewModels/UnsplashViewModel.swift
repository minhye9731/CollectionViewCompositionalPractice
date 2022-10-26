//
//  UnsplashViewModel.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import Foundation

import RxCocoa
import RxSwift

enum SearchError: Error {
    case noPhoto
    case serverError
}

class UnsplashViewModel {

//    var randomPhotoList: CObservable<[RandomPhoto]> = CObservable(RandomPhoto(id: "", urls: Urls(thumb: "https://images.unsplash.com/photo-1664018625610-7538a8367f88?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTgyNjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjY2MzMyNDQ&ixlib=rb-4.0.3&q=80&w=200"), likes: 0))
    
    // 여기에서 [RandomPhoto] 이렇게 배열로 받는 것에 대한 부분때문에, 뷰컨쪽 타입 맞추느라 에러가 많이 발생했었음
    var randomPhotoListPublishSubject = PublishSubject<[RandomPhoto]>()
    var randomPhotoListPublishRelay = PublishRelay<[RandomPhoto]>()
    var randomPhotoListBehaviorRelay = BehaviorRelay<[RandomPhoto]>(value: [RandomPhoto(id: "12345678901", urls: Urls(thumb: "https://images.unsplash.com/photo-1664018625610-7538a8367f88?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTgyNjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjY2MzMyNDQ&ixlib=rb-4.0.3&q=80&w=200"), likes: 100)])
    
//    func requestRandomPhoto() { // 타입때문에 에러남
//        APIService.randomPhoto { photo, statusCode, error in
//            guard let randomPhoto = photo else { return }
//            self.randomPhotoList.value = randomPhoto
//        }
//    }
    
    func requestRandomPhotoPublishSubject() {
        APIService.randomPhoto { [weak self] photo, statusCode, error in
            
            guard let statusCode = statusCode, statusCode == 200 else {
                self?.randomPhotoListPublishSubject.onError(SearchError.serverError)
                return
            }
            
            guard let photo = photo else {
                self?.randomPhotoListPublishSubject.onError(SearchError.noPhoto)
                return
            }
            
            self?.randomPhotoListPublishSubject.onNext(photo)
        }
    }
    
    func requestRandomPhotoPublishRelay() {
        APIService.randomPhoto { [weak self] photo, statusCode, error in
            
            // relay는 error 이벤트를 못 받으니까 그냥 return만 했음
            guard let statusCode = statusCode, statusCode == 200 else { return }
            guard let photo = photo else { return }
            
            self?.randomPhotoListPublishRelay.accept(photo)
            
        }
    }
    
    func requestRandomPhotoBehaviorRelay() {
        APIService.randomPhoto { [weak self] photo, statusCode, error in
            
            // relay는 error 이벤트를 못 받으니까 그냥 return만 했음
            guard let statusCode = statusCode, statusCode == 200 else { return }
            guard let photo = photo else { return }
            
            print("photo.count = \(photo.count)")
            print("statusCode = \(statusCode)")
            
            self?.randomPhotoListBehaviorRelay.accept(photo)
            
        }
    }
    
    
    
    
}

//
//  UnsplashViewModel.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import Foundation

import RxCocoa
import RxSwift
import RxAlamofire
import Alamofire // HTTPHeaders 때문에 import함
import SwiftyJSON

enum SearchError: Error {
    case noPhoto
    case serverError
}

class UnsplashViewModel {
    
    let disposeBag = DisposeBag()

    var randomPhotoListPublishSubject = PublishSubject<[RandomPhoto]>()
    
    //수정 전
//    func requestRandomPhotoPublishSubject() {
//        APIService.randomPhoto { [weak self] photolist, statusCode, error in
//
//            print("view model 확인용1 - \(photolist?.count)") // nil
//            print("view model 확인용1 - \(statusCode)")
//
//            guard let statusCode = statusCode else {
//                self?.randomPhotoListPublishSubject.onError(SearchError.serverError)
//                return
//            }
//
//            guard let photolist = photolist else {
//                self?.randomPhotoListPublishSubject.onError(SearchError.noPhoto)
//                return
//            }
//
//            self?.randomPhotoListPublishSubject.onNext(photolist) // 시점변경
//        }
//    }
    
    let url = APIKey.randomURL
    let header: HTTPHeaders = ["Authorization": APIKey.authorization]
    let params: [String: Int] = ["count" : 20]
    
    func requestRandomPhotoPublishSubject() {
        
        requestJSON(.get, url, parameters: params, headers: header)
            .map { $1 } // Data로 받음
            .debug()
            .map { (response) -> [RandomPhoto] in
                
                let json = JSON(response)
                let data = json.arrayValue
                
                let photoArray: [RandomPhoto] = data.map { item -> RandomPhoto in
                    
                    let id = item["id"].stringValue
                    let url = item["urls"]["thumb"].stringValue
                    let likeCount = item["likes"].intValue
                    
                    return RandomPhoto(id: id, urls: url, likes: likeCount)
                }
                
                print("배열 첫 번째 값 - \(photoArray[0])")
                
                return photoArray
            }
            .subscribe(onNext: { [weak self] photoList in
                self?.randomPhotoListPublishSubject.onNext(photoList)
            })
            .disposed(by: disposeBag)
            
//
           

//                let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
//                let decodedData = try JSONDecoder().decode(RandomPhoto.self, from: data)
//                return [decodedData.self]

//            }
//            .subscribe(onNext: { [weak self] data in
//                self?.randomPhotoListPublishSubject.onNext(data)
//            })
//            .bind(to: randomPhotoListPublishSubject)
//            .disposed(by: disposeBag)
//
//
//            .subscribe(onNext: { [weak self] photolist in
//                self?.randomPhotoListPublishSubject.onNext(photolist)
//            })

    }
}
    
//    func requestRandomPhotoPublishRelay() {
//        APIService.randomPhoto { [weak self] photo, statusCode, error in
//
//            // relay는 error 이벤트를 못 받으니까 그냥 return만 했음
//            guard let statusCode = statusCode, statusCode == 200 else { return }
//            guard let photo = photo else { return }
//
//            self?.randomPhotoListPublishRelay.accept(photo)
//
//        }
//    }
//
//    func requestRandomPhotoBehaviorRelay() { // Relay은 통신에 적절하지 않음. 왜냐면 ui 특화라서 error일 경우 처리가 어려움.
//        APIService.randomPhoto { [weak self] photo, statusCode, error in
//
//            // relay는 error 이벤트를 못 받으니까 그냥 return만 했음
//            guard let statusCode = statusCode, statusCode == 200 else { return }
//            guard let photo = photo else { return }
//
//            print("photo.count = \(photo.count)")
//            print("statusCode = \(statusCode)")
//
//            self?.randomPhotoListBehaviorRelay.accept(photo) // 시점변경
//
//        }
//    }


//
//    let json = JSON(json)
//
//    guard
//    let id = json["id"].stringValue,
//    let url = json["urls"]["thumb"].stringValue,
//    let likeCount = json["likes"].intValue,
//
//    let item = RandomPhoto(id: id, urls: url, likes: likeCount)
//
//    else {
//        return RandomPhoto(id: "00000000000", urls: "https://images.unsplash.com/photo-1664855775450-32eb789a084c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTgyNjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjY5NDM5MDg&ixlib=rb-4.0.3&q=80&w=200", likes: 0)
//    }
//    return .just(item)

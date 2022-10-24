//
//  UnsplashViewModel.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import Foundation

// URL(string: "https://images.unsplash.com/photo-1664018625610-7538a8367f88?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTgyNjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjY2MzMyNDQ&ixlib=rb-4.0.3&q=80&w=200")

class UnsplashViewModel {

    var randomPhotoList: CObservable<[RandomPhoto]> = CObservable(RandomPhoto(id: "", urls: Urls(thumb: "https://images.unsplash.com/photo-1664018625610-7538a8367f88?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNTgyNjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NjY2MzMyNDQ&ixlib=rb-4.0.3&q=80&w=200"), likes: 0))
    
    func requestRandomPhoto() {
        APIService.randomPhoto { photo, statusCode, error in
            guard let randomPhoto = photo else { return }
            self.randomPhotoList.value = randomPhoto
        }
        
    }
    
}

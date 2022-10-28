//
//  RandomPhoto.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//


import Foundation

struct RandomPhotoDTO: Codable, Hashable {
    let id: String
    let urls: String
    let likes: Int

    enum CodingKeys: String, CodingKey {
        case id
        case urls, likes
    }

    init(id: String, urls: String, likes: Int) {
        self.id = id
        self.urls = urls
        self.likes = likes
    }
}

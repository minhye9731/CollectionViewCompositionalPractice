//
//  APIService.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//import RxAlamofire
//
//class APIService {
//
//    static let shared = APIService()
//    private init() { }
//
//    static func randomPhoto(completion: @escaping ([RandomPhoto]?, Int?, Error?) -> Void) {
//
//        let url = APIKey.randomURL
//        let header: HTTPHeaders = ["Authorization": APIKey.authorization]
//        let params: [String: Int] = ["count" : 20]
    
//        AF.request(url, method: .get, parameters: params, headers: header).responseDecodable(of: [RandomPhoto].self) { response in
//
//            let statusCode = response.response?.statusCode
//
//            switch response.result {
//            case .success(let value):
//
////                let json = JSON(value)
////                let data = json["response"].arrayValue
////
//                print(value)
////
////                let result: [RandomPhoto] = data.map { item -> RandomPhoto in
////                    let id = item["id"].stringValue
////                    let url = item["urls"]["thumb"].stringValue
////                    let like = item["likes"].intValue
////
////                    return RandomPhoto(id: id, urls: url, likes: like)
////                }
////                print("api manager용 - \(result)")
//
//                completion(value, statusCode, nil)
//
//            case .failure(let error):
//                completion(nil, statusCode, error)
//
//            }
//        }
//
//
//    }
//}

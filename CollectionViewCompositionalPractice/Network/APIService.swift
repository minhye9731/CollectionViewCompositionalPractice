//
//  APIService.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/24/22.
//

import Foundation
import Alamofire

class APIService {
    
    private init() { }
    
    // 수정 후
    static func randomPhoto(completion: @escaping ([RandomPhoto]?, Int?, Error?) -> Void) { // 여기서 내보낼 때 타입주의! [RandomPhoto]
        
        let url = "\(APIKey.randomURL)"
        let header: HTTPHeaders = ["Authorization": APIKey.authorization]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: [RandomPhoto].self) { response in // 여기서 내보낼 때 타입주의! [RandomPhoto]
            
            let statusCode = response.response?.statusCode
            
            switch response.result {
            case .success(let value): completion(value, statusCode, nil)
            case .failure(let error): completion(nil, statusCode, error)
            }
        }
    }
    


}

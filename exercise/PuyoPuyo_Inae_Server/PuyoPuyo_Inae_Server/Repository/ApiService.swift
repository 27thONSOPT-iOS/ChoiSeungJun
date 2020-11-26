//
//  ApiService.swift
//  PuyoPuyo_Inae_Server
//
//  Created by june on 2020/11/26.
//

import Foundation
import Alamofire

struct ApiService {
    static let client = ApiService()
    
    func getFeed(completion: @escaping (NetworkResult<Any>) -> ()) {
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let req = AF.request(ApiConstants.getFeed, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        req.responseData { (res) in
            switch (res.result) {
                case .success:
                    guard let status = res.response?.statusCode else { return }
                    guard let body = res.value else { return }
                    
                    completion(judgeFeeds(status: status, data: body))
                    
                case .failure(let err):
                    print(err)
                    completion(.networkFail)
            }
        }
        
    }
    
    func judgeFeeds(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(Inaes.self, from: data) else {
            return .pathErr
        }
        
        switch status {
            case 200:
                return .success(decodedData.tests)
            default:
                return .networkFail
        }
    }
}

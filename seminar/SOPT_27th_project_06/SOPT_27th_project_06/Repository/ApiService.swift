//
//  ApiService.swift
//  SOPT_27th_project_06
//
//  Created by june on 2020/11/21.
//

import Foundation
import Alamofire

struct ApiService {
    static let client = ApiService()
    
    let header: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    func postLogin(email: String,
                   password: String,
                   completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(ApiConstants.usersSignInURL,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { res in
            switch res.result {
            case .success:
                guard let statusCode = res.response?.statusCode else {
                    return
                }
                guard let data = res.value else {
                    return
                }
                
                completion(judgeLogin(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        
    }
    
    private func judgeLogin(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<Login>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
            case 200: return .success(decodedData.data!)
            case 400..<500: return .requestErr(decodedData.message)
            case 500: return .serverErr
            default: return .networkFail
        }
    }
    
    func postSignUp(email: String,
                   password: String,
                   userName: String,
                   completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let body: Parameters = [
            "email": email,
            "password": password,
            "userName": userName
        ]
        
        let dataRequest = AF.request(ApiConstants.usersSignUpURL,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { res in
            switch res.result {
            case .success:
                guard let statusCode = res.response?.statusCode else {
                    return
                }
                guard let data = res.value else {
                    return
                }
                
                completion(judgeSignUp(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        
    }
    
    private func judgeSignUp(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignUp>.self, from: data) else {
            return .pathErr
        }
        
        switch status {
            case 200: return .success(decodedData.data!)
            case 400..<500: return .requestErr(decodedData.message)
            case 500: return .serverErr
            default: return .networkFail
        }
    }
}

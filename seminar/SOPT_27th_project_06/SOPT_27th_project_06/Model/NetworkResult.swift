//
//  NetworkResult.swift
//  SOPT_27th_project_06
//
//  Created by june on 2020/11/21.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

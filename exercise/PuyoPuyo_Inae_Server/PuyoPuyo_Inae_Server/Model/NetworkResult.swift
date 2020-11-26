//
//  NetworkResult.swift
//  PuyoPuyo_Inae_Server
//
//  Created by june on 2020/11/26.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

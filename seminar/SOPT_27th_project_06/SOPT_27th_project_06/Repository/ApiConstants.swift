//
//  APIConstants.swift
//  SOPT_27th_project_06
//
//  Created by june on 2020/11/21.
//

import Foundation

struct ApiConstants {
    static let baseURL = "http://15.164.83.210:3000"
    // 로그인 url
    static let usersSignInURL = baseURL + "/users/signin"
    // 회원가입 url
    static let usersSignUpURL = baseURL + "/users/signup"
}

//
//  Inae.swift
//  PuyoPuyo_Inae_Server
//
//  Created by june on 2020/11/26.
//

import Foundation

struct Inaes: Codable {
    let tests: [Inae]
}

struct Inae: Codable {
    let id: Int
    let url, nickname: String
}

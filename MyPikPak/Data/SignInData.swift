//
//  SignInData.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/27/23.
//

import Foundation

struct SignInRequstBody: Encodable {
    let client_id = "YcrttD06T9PIkqAY"
    let client_secret = "A3zfcmfNEeyTH0pX2k4GNg"
    var username: String = ""
    var password: String = ""
}

struct SignIn: Codable {
    var tokenType: String
    var accessToken: String
    var refreshToken: String
    var expiresIn: Int
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case userId = "sub"
    }
    
    static let `default` = SignIn(tokenType: "default", accessToken: "default", refreshToken: "default", expiresIn: 100, userId: "default")
    
    static let url = URL(string: "https://user.mypikpak.com/v1/auth/signin")!
    
}



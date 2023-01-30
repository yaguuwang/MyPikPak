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

struct SignIn: Codable, Equatable {
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
    
    static func == (lhs: SignIn, rhs: SignIn) -> Bool {
        return lhs.tokenType == rhs.tokenType &&
        lhs.accessToken == rhs.accessToken &&
        lhs.refreshToken == rhs.refreshToken &&
        lhs.expiresIn == rhs.expiresIn &&
        lhs.userId == rhs.userId
    }
    
    static let `default` = SignIn(tokenType: "default", accessToken: "default", refreshToken: "default", expiresIn: 100, userId: "default")
    
    static let url = URL(string: "https://user.mypikpak.com/v1/auth/signin")!
    
    static let key = "SignIn"
    
    func saveToUserDefault() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: Self.key)
        } catch {
            fatalError("Unable to save SignIn to userdefault: \(error.localizedDescription)")
        }
    }
    
    static func getFromUserDefault() -> SignIn? {
        let decoder = JSONDecoder()
        do {
            guard let data = UserDefaults.standard.object(forKey: Self.key) as? Data else { return nil }
            let signIn = try decoder.decode(SignIn.self, from: data)
            return signIn
        } catch {
            fatalError("Unable to decode SignIn data from userdefault: \(error.localizedDescription)")
        }
    }
    
    static func removeFromUserDefault() {
        UserDefaults.standard.removeObject(forKey: Self.key)
    }
}



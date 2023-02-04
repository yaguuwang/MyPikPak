//
//  AuthorizationService.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/29/23.
//

import SwiftUI
import Combine

class AuthorizationService: ObservableObject {
    @Published private(set) var isAuthorized = false
    @Published private(set) var authorizationToken: String?
    @Published private(set) var userId: String?
    
    private var request = Set<AnyCancellable>()
    
    init() {
        let signIn = SignIn.getFromUserDefault()
        isAuthorized = signIn != nil
        if let signIn {
            authorizationToken = signIn.tokenType + " " + signIn.accessToken
            userId = signIn.userId
        }
    }
    
    static var example: AuthorizationService {
        AuthorizationService()
    }
    
    func signOut() {
        isAuthorized = false
        SignIn.removeFromUserDefault()
    }
    
    func signIn() {
        let signIn = SignIn.getFromUserDefault()
        isAuthorized = signIn != nil
        if let signIn {
            authorizationToken = signIn.tokenType + " " + signIn.accessToken
            userId = signIn.userId
        }
    }
}

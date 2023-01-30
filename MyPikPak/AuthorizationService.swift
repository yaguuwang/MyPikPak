//
//  AuthorizationService.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/29/23.
//

import SwiftUI

class AuthorizationService: ObservableObject {
    @Published var isAuthorized = false
    
    init() {
        let signIn = SignIn.getFromUserDefault()
        isAuthorized = signIn != nil
    }
    
    static var example: AuthorizationService {
        AuthorizationService()
    }
}

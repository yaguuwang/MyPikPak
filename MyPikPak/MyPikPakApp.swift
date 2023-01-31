//
//  MyPikPakApp.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/27/23.
//

import SwiftUI

@main
struct MyPikPakApp: App {
    @StateObject private var authorizationService = AuthorizationService()
    
    var body: some Scene {
        WindowGroup {
            if authorizationService.isAuthorized {
                MainThreeTierNavView()
                    .environmentObject(authorizationService)
            } else {
                SignInView()
                    .environmentObject(authorizationService)
            }
        }
    }
}

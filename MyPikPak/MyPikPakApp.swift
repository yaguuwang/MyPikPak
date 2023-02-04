//
//  MyPikPakApp.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/27/23.
//

import SwiftUI

@main
struct MyPikPakApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    @StateObject private var authorizationService = AuthorizationService()
    
    var body: some View {
        Group {
            if authorizationService.isAuthorized {
                MainThreeTierNavView()
                    
            } else {
                SignInView()
                    .onReceive(handle_notify(.login)) { _ in
                        authorizationService.signIn()
                    }
            }
        }
        .environmentObject(authorizationService)
    }
}

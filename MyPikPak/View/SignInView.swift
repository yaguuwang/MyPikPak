//
//  ContentView.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/27/23.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var signInVM = SignInViewModel()
    @EnvironmentObject var authorizationService: AuthorizationService
    
    var body: some View {
        VStack {
            TextField("User Name", text: $signInVM.request.username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $signInVM.request.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign In") {
                signInVM.fetchSignIn()
                authorizationService.isAuthorized = signInVM.signedIn
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthorizationService.example)
    }
}

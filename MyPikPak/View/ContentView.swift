//
//  ContentView.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/27/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var signInRequestBody = SignInRequstBody()
    @State private var signIn: SignIn?
    @State private var requests = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            if signIn == nil {
                TextField("User Name", text: $signInRequestBody.username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Password", text: $signInRequestBody.password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Sign In") {
                    fetchSignIn()
                }
            } else {
                Text(signIn!.userId)
                Text(signIn!.accessToken)
                Text(signIn!.tokenType)
            }
        }
        .padding()
        .onAppear(perform: restoreSignIn)
    }
}

extension ContentView {
    private func store(_ signIn: SignIn) {
        guard signIn != .default else { return }
        self.signIn = signIn
        signIn.saveToUserDefault()
    }
    
    private func fetchSignIn() {
        let encoder = JSONEncoder()
        var request = URLRequest(url: SignIn.url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(signInRequestBody)
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: SignIn.self, decoder: JSONDecoder())
            .replaceError(with: .default)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: store)
            .store(in: &requests)
    }
    
    private func restoreSignIn() {
        if let signIn = SignIn.getFromUserDefault() {
            self.signIn = signIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

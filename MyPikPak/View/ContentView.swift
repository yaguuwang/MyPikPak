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
            TextField("User Name", text: $signInRequestBody.username)
                .textFieldStyle(.roundedBorder)
            
            TextField("Password", text: $signInRequestBody.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign In") {
                fetchSignIn()
            }
            
            if let signIn {
                Text(signIn.userId)
                Text(signIn.accessToken)
                Text(signIn.tokenType)
            }
        }
        .padding()
    }
}

extension ContentView {
    private func fetchSignIn() {
        let encoder = JSONEncoder()
        var request = URLRequest(url: SignIn.url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(signInRequestBody)
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: SignIn.self, decoder: JSONDecoder())
            .replaceError(with: .default)
            .sink(receiveValue: { self.signIn = $0 })
            .store(in: &requests)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

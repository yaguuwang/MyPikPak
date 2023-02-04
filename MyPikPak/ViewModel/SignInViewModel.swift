//
//  SignInViewModel.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/29/23.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var request = SignInRequstBody()
    @Published var signedIn = false
    
    private var requests = Set<AnyCancellable>()
    
    func fetchSignIn() {
        let encoder = JSONEncoder()
        var request = URLRequest(url: SignIn.url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(self.request)
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: SignIn.self, decoder: JSONDecoder())
            .replaceError(with: .default)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: store)
            .store(in: &requests)
    }
    
    private func store(_ signIn: SignIn) {
        guard signIn != .default else { return }
        signIn.saveToUserDefault()
        signedIn = true
        notify(.login, nil)
    }
}

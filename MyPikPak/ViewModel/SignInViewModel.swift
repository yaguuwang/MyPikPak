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
    @Published var isSignningIn = false
    
    private var requests = Set<AnyCancellable>()
    
    func fetchSignIn() {
        isSignningIn = true
        let encoder = JSONEncoder()
        var request = URLRequest(url: SignIn.url)
        request.httpMethod = "POST"
        request.httpBody = try? encoder.encode(self.request)
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: SignIn.self, decoder: JSONDecoder())
            .replaceError(with: .default)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [unowned self] signIn in
                guard signIn != .default else {
                    self.isSignningIn = false
                    return
                }
                signIn.saveToUserDefault()
                notify(.login, nil)
            })
            .store(in: &requests)
    }
}

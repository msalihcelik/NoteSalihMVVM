//
//  RegisterViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 18.02.2022.
//

import Foundation
import KeychainSwift

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
    func pushSignIn()
    func signUpButtonTapped(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
    private let keychain = KeychainSwift()
    
    func pushPasswordResetScene() { }
    
    func pushNotesScene() { }
    
    func pushSignIn() {
        router.close(completion: nil)
    }
    
    func signUpButtonTapped(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(fullName: username, email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                if let token = response.data?.accessToken {
                    self.keychain.set(token, forKey: Keychain.token)
                    if let message = response.message {
                        self.showSuccessToast?(message)
                    }
                }
                
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

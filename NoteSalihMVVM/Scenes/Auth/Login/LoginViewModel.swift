//
//  LoginViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import Foundation
import Alamofire
import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func pushPasswordResetScene()
    func signInButtonTapped(email: String, password: String)
    func pushSignUp()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
    let keychain = KeychainSwift()
    
    func pushPasswordResetScene() { }
    
    func signInButtonTapped(email: String, password: String) {
        showLoading?()
        dataProvider.request(for: LoginRequest(email: email, password: password)) { [weak self] result in
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
    
    func pushSignUp() {
        router.pushRegister()
    }
}

//
//  RegisterViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 18.02.2022.
//

import KeychainSwift

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func pushPasswordResetScene()
    func pushSignIn()
    func signUpButtonTapped(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
    private let keychain = KeychainSwift()
    
    func pushPasswordResetScene() {
        router.pushForgotPassword()
    }
    
    func pushSignIn() {
        router.close()
    }
    
    func signUpButtonTapped(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(fullName: username, email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                guard let token = response.data?.accessToken else { return }
                self.keychain.set(token, forKey: Keychain.token)
                self.showSuccessToast?(L10n.Register.success)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

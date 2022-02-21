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
    func pushNotesScene(email: String, password: String)
    func pushSignUp()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
    let keychain = KeychainSwift()
    
    func pushPasswordResetScene() { }
    
    func pushNotesScene(email: String, password: String) {
        dataProvider.request(for: LoginRequest(email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.keychain.set(response.data?.accessToken ?? "", forKey: Keychain.token)
                self.router.pushRegister()
            case .failure:
                self.showWarningToast?(L10n.Login.warningToast)
            
            }
        }
    }
    
    func pushSignUp() {
        router.pushRegister()
    }
}

//
//  LoginViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
    func pushPasswordResetScene() { }
    func pushNotesScene() { }
}

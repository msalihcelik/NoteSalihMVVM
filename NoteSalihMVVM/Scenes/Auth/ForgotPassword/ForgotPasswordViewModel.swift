//
//  ForgotPasswordViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {
    func resetButtonTapped(email: String)
    func pushResetConfirmation(email: String)
}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {
    
    func resetButtonTapped(email: String) {
        showLoading?()
        let request = ForgotPasswordRequest(email: email)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case.success:
                self.pushResetConfirmation(email: email)
            case.failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func pushResetConfirmation(email: String) {
        router.pushResetConfirmation(email: email)
    }
}

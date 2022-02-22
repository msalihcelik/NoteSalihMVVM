//
//  ForgotPasswordViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {
    func resetButtonTapped(email: String)
    func pushResetConfirmation(email: String)
}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {
    
    func resetButtonTapped(email: String) {
        showLoading?()
        dataProvider.request(for: ForgotPasswordRequest(email: email)) { [weak self] (result) in
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

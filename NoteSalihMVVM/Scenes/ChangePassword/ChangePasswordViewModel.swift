//
//  ChangePasswordViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

protocol ChangePasswordViewDataSource {}

protocol ChangePasswordViewEventSource {}

protocol ChangePasswordViewProtocol: ChangePasswordViewDataSource, ChangePasswordViewEventSource {}

final class ChangePasswordViewModel: BaseViewModel<ChangePasswordRouter>, ChangePasswordViewProtocol {
    
    func sameAllError() {
        self.showWarningToast?(L10n.ChangePassword.sameOldPassword)
    }
    
    func differentPasswordError() {
        self.showWarningToast?(L10n.ChangePassword.differentNewPassword)
    }
}

// MARK: - Network
extension ChangePasswordViewModel {
    
    func changePassword(password: String, newPassword: String, retypeNewPassword: String) {
        dataProvider.request(for: ChangePasswordRequest(password: password,
                                                        newPassword: newPassword,
                                                        newPasswordConfirmation: retypeNewPassword)) { [weak self] result in
            switch result {
            case .success:
                ToastPresenter.showSuccessToast(text: L10n.ChangePassword.success)
            case .failure(let error):
                ToastPresenter.showWarningToast(text: error.localizedDescription)
            }
        }
    }
}

// MARK: - Action
extension ChangePasswordViewModel {
    
    func leftIconTapped() {
        router.close()
    }
}

//
//  ProfileViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

protocol ProfileViewDataSource {
    
}

protocol ProfileViewEventSource {
    var reloadUser: VoidClosure? { get set }
}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {
    func getUser()
    func updateUser(userName: String, email: String)
    func leftIconTapped()
    func changePasswordTapped()
    func signOutTapped()
}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    
    var user: User = User(fullName: "", email: "", id: 0)
    var reloadUser: VoidClosure?
    
    var getFullName: String {
        return user.fullName ?? ""
    }
    
    var getEmail: String {
        return user.email ?? ""
    }
}

// MARK: - Network
extension ProfileViewModel {
    
    func getUser() {
        showLoading?()
        dataProvider.request(for: GetUserRequest()) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                guard let data = response.data else { return }
                self.user = data
                self.reloadUser?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func updateUser(userName: String, email: String) {
        showLoading?()
        dataProvider.request(for: UpdateUserRequest(fullName: userName, email: email)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.showSuccessToast?(L10n.Profile.success)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

// MARK: - Actions
extension ProfileViewModel {
    
    func leftIconTapped() {
        router.close()
    }
    
    func changePasswordTapped() {
        
    }
    
    func signOutTapped() {
        router.popToRoot()
    }
}

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

    func getUser() {
        
    }
    
    func updateUser(userName: String, email: String) {
        
    }
    
    func leftIconTapped() {
        
    }
    
    func changePasswordTapped() {
        
    }
    
    func signOutTapped() {
        
    }
}

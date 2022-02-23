//
//  ResetConfirmationViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

import Foundation

protocol ResetConfirmationViewDataSource {
    var email: String { get set }
}

protocol ResetConfirmationViewEventSource {}

protocol ResetConfirmationViewProtocol: ResetConfirmationViewDataSource, ResetConfirmationViewEventSource {
    func loginButtonTapped()
}

final class ResetConfirmationViewModel: BaseViewModel<ResetConfirmationRouter>, ResetConfirmationViewProtocol {
    
    var email: String = ""
    
    init(email: String, router: ResetConfirmationRouter) {
        super.init(router: router)
        self.email = email
    }
    
    func loginButtonTapped() {
        router.popToRoot()
    }
}

//
//  ChangePasswordRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

protocol ChangePasswordRoute {
    func pushChangePassword()
}

extension ChangePasswordRoute where Self: RouterProtocol {
    
    func pushChangePassword() {
        let router = ChangePasswordRouter()
        let viewModel = ChangePasswordViewModel(router: router)
        let viewController = ChangePasswordViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

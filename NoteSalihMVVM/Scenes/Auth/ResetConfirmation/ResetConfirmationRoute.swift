//
//  ResetConfirmationRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

protocol ResetConfirmationRoute {
    func pushResetConfirmation(email: String)
}

extension ResetConfirmationRoute where Self: RouterProtocol {
    
    func pushResetConfirmation(email: String) {
        let router = ResetConfirmationRouter()
        let viewModel = ResetConfirmationViewModel(email: email, router: router)
        let viewController = ResetConfirmationViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

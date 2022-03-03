//
//  ProfileRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

protocol ProfileRoute {
    func pushProfile()
}

extension ProfileRoute where Self: RouterProtocol {
    
    func pushProfile() {
        let router = ProfileRouter()
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

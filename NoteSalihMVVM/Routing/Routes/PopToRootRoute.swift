//
//  PopToRootRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 23.02.2022.
//

protocol PopToRootRoute {
    func popToRoot(isAnimated: Bool)
}

extension PopToRootRoute where Self: RouterProtocol {
    
    func popToRoot(isAnimated: Bool = true) {
        guard let navigationController = viewController?.navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: isAnimated)
    }
}

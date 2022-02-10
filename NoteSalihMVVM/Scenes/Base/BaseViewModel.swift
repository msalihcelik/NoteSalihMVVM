//
//  BaseViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {
    
}

protocol BaseViewModelEventSource: AnyObject {

}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R

    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}

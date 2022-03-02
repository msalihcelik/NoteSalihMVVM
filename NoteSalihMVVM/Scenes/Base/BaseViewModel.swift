//
//  BaseViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import Foundation
import Utilities

protocol BaseViewModelDataSource: AnyObject {
    
}

protocol BaseViewModelEventSource: AnyObject {
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    var showActivityIndicatorView: ((ActivityPosition?) -> Void)? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    var showWarningToast: StringClosure? { get set }
    var showSuccessToast: StringClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    let dataProvider: DataProviderProtocol
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showActivityIndicatorView: ((ActivityPosition?) -> Void)?
    var hideActivityIndicatorView: VoidClosure?
    
    var showWarningToast: StringClosure?
    var showSuccessToast: StringClosure?

    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}

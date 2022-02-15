//
//  BaseViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, LoadingProtocol, ActivityIndicatorProtocol {
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeViewModel()
    }
    
    deinit {
        debugPrint("deinit: \(self)")
    }
}

// MARK: - SubscribeViewModel
extension BaseViewController {
    
    private func subscribeViewModel() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
        
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
}

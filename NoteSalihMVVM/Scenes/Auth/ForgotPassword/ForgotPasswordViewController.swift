//
//  ForgotPasswordViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = AuthHeaderView()
    private let emailTextField = AuthTextField()
    private let resetButton = AuthButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
    
}

// MARK: - UILayout
extension ForgotPasswordViewController {
    
    private func addSubViews() {
        addScrollView()
        addContentView()
        addHeaderView()
        addEmailTextField()
        addResetButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func addContentView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addHeaderView() {
        contentView.addSubview(headerView)
        headerView.edgesToSuperview(excluding: .bottom, insets: .init(top: 59, left: 25, bottom: 0, right: 25))
    }
    
    private func addEmailTextField() {
        contentView.addSubview(emailTextField)
        emailTextField.topToBottom(of: headerView, offset: 31)
        emailTextField.edgesToSuperview(excluding: [.top, .bottom], insets: .left(25) + .right(25))
    }
    
    private func addResetButton() {
        contentView.addSubview(resetButton)
        resetButton.topToBottom(of: emailTextField, offset: 35)
        resetButton.edgesToSuperview(excluding: .top, insets: .left(25) + .right(25))
    }
}

// MARK: - Configure & SetLocalize
extension ForgotPasswordViewController {
    
    private func configureContents() {
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Forgot.title
        headerView.descriptionText = L10n.Forgot.description
        emailTextField.placeholder = L10n.Forgot.email
        resetButton.setTitle(L10n.Forgot.reset, for: .normal)
    }
}

// MARK: - Actions
extension ForgotPasswordViewController {
    
    @objc
    private func resetButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            viewModel.showWarningToast?(L10n.Forgot.emptyEmail)
            return
        }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        viewModel.resetButtonTapped(email: email)
    }
}

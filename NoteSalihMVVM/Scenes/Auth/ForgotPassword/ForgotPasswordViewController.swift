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
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
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
        addStackView()
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
    
    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .init(top: 59, left: 25, bottom: 0, right: 25))
    }
    
    private func addHeaderView() {
        stackView.addArrangedSubview(headerView)
        stackView.setCustomSpacing(31, after: headerView)
    }
    
    private func addEmailTextField() {
        stackView.addArrangedSubview(emailTextField)
        stackView.setCustomSpacing(35, after: emailTextField)
    }
    
    private func addResetButton() {
        stackView.addArrangedSubview(resetButton)
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

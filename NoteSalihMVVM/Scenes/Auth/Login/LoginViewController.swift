//
//  LoginViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import UIComponents

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let header: AuthHeaderView = {
        let header = AuthHeaderView()
        return header
    }()
    
    private let formStackView = UIStackViewBuilder()
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.fillEqually)
        .spacing(14)
        .build()
    private let emailTextField: AuthTextField = {
        let textField = AuthTextField()
        return textField
    }()
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let buttonStackView = UIStackViewBuilder()
        .axis(.vertical)
        .alignment(.trailing)
        .distribution(.fill)
        .spacing(27)
        .build()
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.josefinSansRegular, size: 13))
        .titleColor(.appEbonyClay)
        .build()
    private let loginButton: AuthButton = {
        let button = AuthButton()
        return button
    }()
    
    private let footer: AuthFooterView = {
        let footer = AuthFooterView()
        return footer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLocalize()
    }
}

// MARK: - UILayout
extension LoginViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentView()
        addHeader()
        addFormStackView()
        addButtonStackView()
        addFooter()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
    }
    
    private func addContentView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.width(to: view)
    }
    
    private func addHeader() {
        contentView.addSubview(header)
        header.edgesToSuperview(excluding: .bottom, insets: .init(top: 103, left: 25, bottom: 0, right: 25), usingSafeArea: true)
    }
    
    private func addFormStackView() {
        contentView.addSubview(formStackView)
        formStackView.topToBottom(of: header, offset: 39)
        formStackView.edgesToSuperview(excluding: [.top, .bottom], insets: .init(top: 0, left: 25, bottom: 0, right: 25))
        
        formStackView.addArrangedSubview(emailTextField)
        emailTextField.height(47)
        
        formStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(47)
    }
    
    private func addButtonStackView() {
        contentView.addSubview(buttonStackView)
        buttonStackView.topToBottom(of: formStackView, offset: 13)
        buttonStackView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 25, bottom: 380, right: 25), isActive: true)
        
        buttonStackView.addArrangedSubview(forgotPasswordButton)
        
        buttonStackView.addArrangedSubview(loginButton)
        loginButton.edgesToSuperview(excluding: .top)
        loginButton.height(60)
    }
    
    private func addFooter() {
        view.addSubview(footer)
        footer.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 25, bottom: 21, right: 25), usingSafeArea: true)
        
        footer.leftLabelText = L10n.Login.newUser
        footer.signButtonTitle = L10n.Login.signUp
        footer.height(15)
    }
}

// MARK: - Configure & SetLocalize
extension LoginViewController {
    
    private func setLocalize() {
        header.titleText = L10n.Login.title
        header.descriptionText = L10n.Login.description
        
        emailTextField.placeholder = L10n.Login.email
        passwordTextField.placeholder = L10n.Login.password
        
        forgotPasswordButton.setTitle(L10n.Login.forgot, for: .normal)
        loginButton.setTitle(L10n.Login.title, for: .normal)
    }
}

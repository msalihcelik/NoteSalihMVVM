//
//  LoginViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 10.02.2022.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = AuthHeaderView()
    
    private let formStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .spacing(14)
        .build()
    private let emailTextField = AuthTextField()
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let buttonStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(27)
        .build()
    private let forgotPasswordView = UIViewBuilder().build()
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.josefinSansRegular, size: 13))
        .titleColor(.appEbonyClay)
        .build()
    private let signInButton = AuthButton()
    
    private let signUpView = AuthFooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
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
        addSignUpView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addContentView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addHeader() {
        contentView.addSubview(headerView)
        headerView.edgesToSuperview(excluding: .bottom, insets: .init(top: 59, left: 25, bottom: 0, right: 25), usingSafeArea: true)
    }
    
    private func addFormStackView() {
        contentView.addSubview(formStackView)
        formStackView.topToBottom(of: headerView, offset: 39)
        formStackView.edgesToSuperview(excluding: [.top, .bottom], insets: .left(25) + .right(25))
        
        formStackView.addArrangedSubview(emailTextField)
        formStackView.addArrangedSubview(passwordTextField)
    }
    
    private func addButtonStackView() {
        contentView.addSubview(buttonStackView)
        buttonStackView.topToBottom(of: formStackView, offset: 13)
        buttonStackView.edgesToSuperview(excluding: .top, insets: .left(25) + .right(25))
        
        buttonStackView.addArrangedSubview(forgotPasswordView)
        buttonStackView.addArrangedSubview(signInButton)
        
        forgotPasswordView.addSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .left)
    }
    
    private func addSignUpView() {
        view.addSubview(signUpView)
        signUpView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 25, bottom: 21, right: 25), usingSafeArea: true)
        signUpView.topToBottom(of: scrollView)
    }
}

// MARK: - Configure & SetLocalize
extension LoginViewController {
    
    private func configureContents() {
        configureSignUpView()
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func configureSignUpView() {
        signUpView.actionClosure = { [weak self] in
            self?.viewModel.pushSignUp()
        }
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Login.title
        headerView.descriptionText = L10n.Login.description
        
        emailTextField.placeholder = L10n.Login.email
        passwordTextField.placeholder = L10n.Login.password
        
        forgotPasswordButton.setTitle(L10n.Login.forgot, for: .normal)
        signInButton.setTitle(L10n.Login.title, for: .normal)
        
        signUpView.leftLabelText = L10n.Login.newUser
        signUpView.signButtonTitle = L10n.Login.signUp
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func signInButtonTapped() {
        
        if let email = emailTextField.text, email.isEmpty,
           let password = passwordTextField.text, password.isEmpty {
            viewModel.showWarningToast?(L10n.Login.emptyEmailPassword)
        } else {
            guard let email = emailTextField.text, !email.isEmpty else {
                viewModel.showWarningToast?(L10n.Login.emptyEmail)
                return
            }
            
            guard let password = passwordTextField.text, !password.isEmpty else {
                viewModel.showWarningToast?(L10n.Login.emptyPassword)
                return
            }
            
            let validation = Validation()
            guard validation.isValidPassword(password) else { return }
            guard validation.isValidEmail(email) else { return }
            viewModel.signInButtonTapped(email: email, password: password)
        }
    }
}

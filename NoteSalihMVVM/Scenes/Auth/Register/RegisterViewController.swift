//
//  RegisterViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 18.02.2022.
//

import UIKit

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = AuthHeaderView()
    
    private let formStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .spacing(14)
        .build()
    private let fullNameTextField = AuthTextField()
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
    private let signUpButton = AuthButton()

    private let signInView = AuthFooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.setHidesBackButton(false, animated: true)
    }
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentView()
        addHeader()
        addFormStackView()
        addButtonStackView()
        addSignInView()
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
        
        formStackView.addArrangedSubview(fullNameTextField)
        formStackView.addArrangedSubview(emailTextField)
        formStackView.addArrangedSubview(passwordTextField)
    }
    
    private func addButtonStackView() {
        contentView.addSubview(buttonStackView)
        buttonStackView.topToBottom(of: formStackView, offset: 13)
        buttonStackView.edgesToSuperview(excluding: .top, insets: .left(25) + .right(25))
        
        buttonStackView.addArrangedSubview(forgotPasswordView)
        buttonStackView.addArrangedSubview(signUpButton)
        
        forgotPasswordView.addSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .left)
    }
    
    private func addSignInView() {
        view.addSubview(signInView)
        signInView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 25, bottom: 21, right: 25), usingSafeArea: true)
        signInView.topToBottom(of: scrollView)
    }
}

// MARK: - Configure & SetLocalize
extension RegisterViewController {
    
    private func configureContents() {
        configureSignUpView()
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func configureSignUpView() {
        signInView.actionClosure = { [weak self] in
            self?.viewModel.pushSignIn()
        }
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Register.title
        headerView.descriptionText = L10n.Register.description
        
        fullNameTextField.placeholder = L10n.Register.fullName
        emailTextField.placeholder = L10n.Register.email
        passwordTextField.placeholder = L10n.Register.password
        
        forgotPasswordButton.setTitle(L10n.Register.forgot, for: .normal)
        signUpButton.setTitle(L10n.Register.title, for: .normal)
        
        signInView.leftLabelText = L10n.Register.already
        signInView.signButtonTitle = L10n.Register.signIn
    }
}

// MARK: - Actions
extension RegisterViewController {
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func signUpButtonTapped() {
        viewModel.pushNotesScene()
    }
}

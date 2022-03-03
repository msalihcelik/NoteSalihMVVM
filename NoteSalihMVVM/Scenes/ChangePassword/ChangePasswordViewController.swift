//
//  ChangePasswordViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

final class ChangePasswordViewController: BaseViewController<ChangePasswordViewModel> {
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    private let passwordTextField = AuthTextField()
    private let newPasswordTextField = AuthTextField()
    private let retypeNewPasswordTextField = AuthTextField()
    private let saveButton = AuthButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
    
}

// MARK: - UILayout
extension ChangePasswordViewController {
    
    private func addSubViews() {
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 22, left: 25, bottom: 25, right: 25), usingSafeArea: true)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(retypeNewPasswordTextField)
        stackView.setCustomSpacing(33, after: retypeNewPasswordTextField)
    }
}

// MARK: - Configure & SetLocalize
extension ChangePasswordViewController {
    
    private func configureContents() {
        configureNavigation()
        passwordTextField.isSecureTextEntry = true
        newPasswordTextField.isSecureTextEntry = true
        retypeNewPasswordTextField.isSecureTextEntry = true
    }
    
    private func configureNavigation() {
        let leftIcon = UIBarButtonItem(image: .icHamburger, style: .plain, target: self, action: #selector(leftIconTapped))
        navigationItem.leftBarButtonItems = [leftIcon]
    }
    
    private func setLocalize() {
        title = L10n.ChangePassword.changePassword
        passwordTextField.placeholder = L10n.ChangePassword.password
        newPasswordTextField.placeholder = L10n.ChangePassword.newPassword
        retypeNewPasswordTextField.placeholder = L10n.ChangePassword.retypeNewPassword
        saveButton.setTitle(L10n.ChangePassword.save, for: .normal)
    }
}

// MARK: - Actions
extension ChangePasswordViewController {
    
    @objc
    private func saveButtonTapped() {
        
    }
    
    @objc
    private func leftIconTapped() {
        
    }
}

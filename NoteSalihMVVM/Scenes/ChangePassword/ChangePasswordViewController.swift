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
        stackView.addArrangedSubview(saveButton)
    }
}

// MARK: - Configure & SetLocalize
extension ChangePasswordViewController {
    
    private func configureContents() {
        configureNavigation()
        passwordTextField.isSecureTextEntry = true
        newPasswordTextField.isSecureTextEntry = true
        retypeNewPasswordTextField.isSecureTextEntry = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
        guard let password = passwordTextField.text, !password.isEmpty,
              let newPassword = newPasswordTextField.text, !newPassword.isEmpty,
              let retypeNewPassword = retypeNewPasswordTextField.text, !retypeNewPassword.isEmpty else {
                  ToastPresenter.showWarningToast(text: L10n.ChangePassword.emptyError)
            return
        }
        let validation = Validation()
        guard validation.isValidPassword(password),
              validation.isValidPassword(newPassword) else { return }
        guard newPassword == retypeNewPassword else {
            viewModel.differentPasswordError()
            return
        }
        guard password != newPassword, password != retypeNewPassword else {
            viewModel.sameAllError()
            return
        }
        viewModel.changePassword(password: password, newPassword: newPassword, retypeNewPassword: retypeNewPassword)
    }
    
    @objc
    private func leftIconTapped() {
        viewModel.leftIconTapped()
    }
}

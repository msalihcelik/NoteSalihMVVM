//
//  ProfileViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    private let stackView = UIStackViewBuilder()
        .spacing(15)
        .axis(.vertical)
        .build()
    private let fullNameTextField = AuthTextField()
    private let emailTextField = AuthTextField()
    private let saveButton = AuthButton()
    private let changePasswordButton = UIButtonBuilder()
        .build()
    private let signOutButton = UIButtonBuilder()
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        viewModel.getUser()
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
extension ProfileViewController {
    
    private func addSubViews() {
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 25, left: 25, bottom: 25, right: 25), usingSafeArea: true)
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(changePasswordButton)
        stackView.addArrangedSubview(signOutButton)
    }
}

// MARK: - Configure & SetLocalize
extension ProfileViewController {
    
    private func configureContents() {
        configureNavigation()
        configureSaveButton()
        configureChangePasswordButton()
        configureSignOutButton()
    }
    
    private func configureNavigation() {
        let leftIcon = UIBarButtonItem(image: .icHamburger, style: .plain, target: self, action: #selector(leftIconTapped))
        navigationItem.leftBarButtonItems = [leftIcon]
    }
    
    private func configureSaveButton() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func configureChangePasswordButton() {
        changePasswordButton.titleLabel?.font = .font(.josefinSansSemiBold, size: 14)
        changePasswordButton.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)
    }
    
    private func configureSignOutButton() {
        signOutButton.titleLabel?.font = .font(.josefinSansSemiBold, size: 14)
        signOutButton.setTitleColor(.appRed, for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        title = L10n.Profile.profile
        saveButton.setTitle(L10n.Profile.save, for: .normal)
        changePasswordButton.setTitle(L10n.Profile.changePassword, for: .normal)
        signOutButton.setTitle(L10n.Profile.signOut, for: .normal)
    }
}

// MARK: - Actions
extension ProfileViewController {

    @objc
    private func saveButtonTapped() {
    
    }
    
    @objc
    private func changePasswordTapped() {
        viewModel.changePasswordTapped()
    }
    
    @objc
    private func signOutTapped() {
        viewModel.signOutTapped()
    }
    
    @objc
    private func leftIconTapped() {
        viewModel.leftIconTapped()
    }
}

// MARK: - SubscribeViewModel
extension ProfileViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadUser = { [weak self] in
            guard let self = self else { return }
        }
    }
}

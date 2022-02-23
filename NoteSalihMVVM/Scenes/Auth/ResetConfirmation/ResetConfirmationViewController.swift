//
//  ResetConfirmationViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 22.02.2022.
//

import TinyConstraints
import MobilliumBuilders

final class ResetConfirmationViewController: BaseViewController<ResetConfirmationViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    private let headerView = AuthHeaderView()
    private let loginButton = AuthButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
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
extension ResetConfirmationViewController {
    
    private func addSubViews() {
        addScrollView()
        addContentView()
        addStackView()
        addHeaderView()
        addLoginButton()
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
        stackView.setCustomSpacing(36, after: headerView)
    }
    
    private func addLoginButton() {
        stackView.addArrangedSubview(loginButton)
    }
}

// MARK: - Configure & SetLocalize
extension ResetConfirmationViewController {
    
    private func configureContents() {
        headerView.descriptionColor = .appGreen
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.ResetConfirmation.title
        headerView.descriptionText = L10n.ResetConfirmation.description(viewModel.email)
        
        loginButton.setTitle(L10n.ResetConfirmation.login, for: .normal)
    }
}

// MARK: - Actions
extension ResetConfirmationViewController {
    
    @objc
    private func loginButtonTapped() {
        viewModel.loginButtonTapped()
    }
}

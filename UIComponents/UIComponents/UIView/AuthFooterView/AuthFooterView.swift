//
//  AuthFooterView.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 15.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

public class AuthFooterView: UIView {
    
    private let leftLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 15))
        .textAlignment(.center)
        .build()
    private let signButton = UIButtonBuilder()
        .titleFont(.font(.josefinSansRegular, size: 15))
        .build()
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .alignment(.center)
        .build()
    
    public var leftLabelText: String? {
        didSet {
            leftLabel.text = leftLabelText
        }
    }
    
    public var signButtonTitle: String? {
        didSet {
            signButton.setTitle(signButtonTitle, for: .normal)
        }
    }
    
    public var emptyClosure: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        addSubviews()
    }
    
    // swiftlint:disable all
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable all
    
}

// MARK: - UILayout
extension AuthFooterView {
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(signButton)
        stackView.centerXToSuperview()
        stackView.leadingToSuperview(relation: .equalOrGreater)
        stackView.trailingToSuperview(relation: .equalOrLess)
    }
}

// MARK: - Configure
extension AuthFooterView {
    
    private func configureContents() {
        signButton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension AuthFooterView {
    
    @objc
    private func signButtonTapped(_ sender: UITapGestureRecognizer) {
        emptyClosure?()
    }
}

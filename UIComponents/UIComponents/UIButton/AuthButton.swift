//
//  AuthButton.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 15.02.2022.
//

import UIKit

public class AuthButton: UIButton {
    
    public var buttonTitle: String? {
        didSet {
            setTitle(buttonTitle, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable all
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable all
    
}

// MARK: - Configure
extension AuthButton {
    
    private func configureContents() {
        backgroundColor = .appBlue
        titleLabel?.font = .font(.josefinSansSemiBold, size: 15)
        layer.cornerRadius = 5
    }
}

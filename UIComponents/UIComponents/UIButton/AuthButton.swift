//
//  AuthButton.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 15.02.2022.
//

import UIKit

public class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable all
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable all
    
    public var height: CGFloat {
        get {
            let heightConstraint = constraints.first(where: { $0.firstAttribute == .height })
            return heightConstraint?.constant ?? 0
        }
        set(newValue) {
            let heightConstraint = constraints.first(where: { $0.firstAttribute == .height })
            heightConstraint?.constant = newValue
        }
    }
}

// MARK: - Configure
extension AuthButton {
    
    private func configureContents() {
        backgroundColor = .appBlue
        tintColor = .appWhite
        titleLabel?.font = .font(.josefinSansSemiBold, size: 15)
        layer.cornerRadius = 5
        height(60)
    }
}

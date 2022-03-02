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
    
    public override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    public func setHeight(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

// MARK: - Configure
extension AuthButton {
    
    private func configureContents() {
        backgroundColor = .appBlue
        tintColor = .appWhite
        titleLabel?.font = .font(.josefinSansSemiBold, size: 15)
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

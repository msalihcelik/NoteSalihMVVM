//
//  AuthTextField.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 15.02.2022.
//

import UIKit
import MobilliumBuilders

class ToastWarningView: UIView {
    
    private let label = UILabelBuilder()
        .font(.font(.josefinSansSemiBold, size: 13))
        .textColor(.appSilver)
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
    init(text: String) {
        label.text = text
        label.sizeToFit()
        super.init(frame: .zero)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}

// MARK: - Configure
extension ToastWarningView {
    
    private func configureContents() {
        addSubview(label)
        label.edgesToSuperview(insets: .init(top: 13, left: 13, bottom: 13, right: 13))
    }
}

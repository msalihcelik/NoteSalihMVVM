//
//  AuthHeaderView.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 14.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

public class AuthHeaderView: UIView {
    
    private let titleLabel = UILabelBuilder()
        .textColor(.appEbonyClay)
        .font(.font(.josefinSansRegular, size: 26))
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .textColor(.appDarkGray)
        .font(.font(.josefinSansRegular, size: 15))
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    private let stackView = UIStackViewBuilder()
        .alignment(.center)
        .axis(.vertical)
        .spacing(14)
        .build()
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    public var descriptionColor: UIColor? {
        didSet {
            descriptionLabel.textColor = descriptionColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
}

// MARK: - UILayout
extension AuthHeaderView {
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.edgesToSuperview()
    }
}

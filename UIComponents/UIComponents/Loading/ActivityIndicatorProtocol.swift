//
//  ActivityIndicatorProtocol.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 15.02.2022.
//

import UIKit
import TinyConstraints

public protocol ActivityIndicatorProtocol {
    func showActivityIndicator(position: ActivityPosition)
    func hideActivityIndicator()
}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    func showActivityIndicator(position: ActivityPosition) {
        let indicator = ActivityIndicatorView(frame: .infinite)
        indicator.startAnimating()
        view.addSubview(indicator)
//        indicator.centerInSuperview()
        switch position {
        case .center:
            indicator.centerInSuperview()
        case .bottom:
            indicator.centerXToSuperview()
            indicator.bottomToSuperview(usingSafeArea: true)
        }
        view.bringSubviewToFront(indicator)
    }
    
    func hideActivityIndicator() {
        view.subviews.filter({ $0 is ActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
}

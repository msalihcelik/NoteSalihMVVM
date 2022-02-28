//
//  ReusableView.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

//
//  ChangePasswordViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

import Foundation

protocol ChangePasswordViewDataSource {}

protocol ChangePasswordViewEventSource {}

protocol ChangePasswordViewProtocol: ChangePasswordViewDataSource, ChangePasswordViewEventSource {}

final class ChangePasswordViewModel: BaseViewModel<ChangePasswordRouter>, ChangePasswordViewProtocol {
    
}

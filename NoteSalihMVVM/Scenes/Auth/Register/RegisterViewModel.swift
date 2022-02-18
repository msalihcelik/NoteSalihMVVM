//
//  RegisterViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 18.02.2022.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
}

//
//  ProfileViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 3.03.2022.
//

import Foundation

protocol ProfileViewDataSource {}

protocol ProfileViewEventSource {}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    
}

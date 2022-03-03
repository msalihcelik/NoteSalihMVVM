//
//  NoteListRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 23.02.2022.
//

protocol NoteListRoute {
    func pushNoteList()
}

extension NoteListRoute where Self: RouterProtocol {
    
    func pushNoteList() {
        let router = NoteListRouter()
        let viewModel = NoteListViewModel(router: router)
        let viewController = NoteListViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

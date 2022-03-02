//
//  NoteDetailsRoute.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

protocol NoteDetailsRoute {
    func pushNoteDetails(with note: NoteTableViewCellModel?, showType: ShowType, updateNoteList: ((NoteTableViewCellModel) -> Void)?)
}

extension NoteDetailsRoute where Self: RouterProtocol {
    
    func pushNoteDetails(with note: NoteTableViewCellModel?, showType: ShowType, updateNoteList: ((NoteTableViewCellModel) -> Void)?) {
        let router = NoteDetailsRouter()
        let viewModel = NoteDetailsViewModel(router: router, note: note, showType: showType, updateNoteList: updateNoteList)
        let viewController = NoteDetailsViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}

//
//  NoteListRouter.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 23.02.2022.
//

final class NoteListRouter: Router, NoteListRouter.Routes {
    typealias Routes = NoteDetailsRoute & ProfileRoute
}

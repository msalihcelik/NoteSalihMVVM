//
//  NoteTableViewCell+Extension.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 28.02.2022.
//

extension NoteTableViewCellModel {
    
    convenience init(with note: Note) {
        self.init(title: note.title ?? "", description: note.note ?? "", id: note.id ?? 0)
    }
    
    convenience init(with note: NoteTableViewCellModel) {
        self.init(title: note.title, description: note.description, id: note.id)
    }
}

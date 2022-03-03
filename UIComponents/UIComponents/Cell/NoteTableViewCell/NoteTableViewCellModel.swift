//
//  NoteTableViewCellModel.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

public protocol NoteTableViewCellDataSource: AnyObject {
    var title: String { get set }
    var description: String { get set }
    var id: Int { get set }
}

public protocol NoteTableViewCellEventSource: AnyObject {
    
}

public protocol NoteTableViewCellProtocol: NoteTableViewCellDataSource, NoteTableViewCellEventSource {
    
}

public final class NoteTableViewCellModel: NoteTableViewCellProtocol {
    
    public var title: String
    public var description: String
    public var id: Int
    
    public init(title: String, description: String, id: Int) {
        self.title = title
        self.description = description
        self.id = id
    }
}

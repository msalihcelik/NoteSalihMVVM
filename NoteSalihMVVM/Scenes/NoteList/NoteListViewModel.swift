//
//  NoteListViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 23.02.2022.
//

protocol NoteListViewDataSource {
    var numberOfItems: Int { get }
    var page: Int { get set }
    
    func cellItemAt(indexPath: IndexPath) -> NoteTableViewCellProtocol
}

protocol NoteListViewEventSource {
    var reloadData: VoidClosure? { get set }
    var didUpdateTableViewRow: IndexPathClosure? { get set }
}

protocol NoteListViewProtocol: NoteListViewDataSource, NoteListViewEventSource {
    func getMyNotes()
    func addNoteButtonTapped()
    func editButtonTapped(at indexPath: IndexPath)
    func deleteButtonTapped(at indexPath: IndexPath)
    func didRemoveNote(at indexPath: IndexPath)
}

final class NoteListViewModel: BaseViewModel<NoteListRouter>, NoteListViewProtocol {
    
    private var cellItems: [NoteTableViewCellProtocol] = []
    var didUpdateTableViewRow: IndexPathClosure?
    var reloadData: VoidClosure?
    var page: Int = 1
    var isPagingEnabled = false
    var isRequestEnabled = false
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    var getCellItems: [NoteTableViewCellProtocol] {
        return cellItems
    }
    
    func cellItemAt(indexPath: IndexPath) -> NoteTableViewCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didRemoveNote(at indexPath: IndexPath) {
        cellItems.remove(at: indexPath.row)
    }
}

// MARK: - Actions
extension NoteListViewModel {
    
    func addNoteButtonTapped() {
        router.pushNoteDetails(with: nil, showType: .create) { [weak self] (note) in
            let note = NoteTableViewCellModel(with: note)
            self?.cellItems.insert(note, at: 0)
            self?.getMyNotes()
        }
    }
    
    func editButtonTapped(at indexPath: IndexPath) {
        editNote(at: indexPath)
    }
    
    func deleteButtonTapped(at indexPath: IndexPath) {
        deleteNote(at: indexPath)
    }
}

// MARK: - Network
extension NoteListViewModel {
    
    func getMyNotes() {
        self.isRequestEnabled = false
        dataProvider.request(for: GetMyNotesRequest(page: page)) { [weak self] (result) in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.data.map({ NoteTableViewCellModel(with: $0) })
                self.cellItems = cellItems
                self.page += 1
                self.isPagingEnabled = response.data.currentPage < response.data.lastPage
                self.reloadData?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    private func editNote(at indexPath: IndexPath) {
        let title = cellItems[indexPath.row].title
        let note = cellItems[indexPath.row].description
        let id = cellItems[indexPath.row].id
        let model = NoteTableViewCellModel(title: title, description: note, id: id)
        
        router.pushNoteDetails(with: model, showType: .update) { [weak self] editedNote in
            guard let self = self else { return }
            self.cellItems[indexPath.row] = editedNote
            self.didUpdateTableViewRow?(indexPath)
        }
    }
    
    private func deleteNote(at indexPath: IndexPath) {
        let id = cellItems[indexPath.row].id
        dataProvider.request(for: DeleteNoteRequest(id: id)) { [weak self] (result) in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success:
                self.didRemoveNote(at: indexPath)
                self.reloadData?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

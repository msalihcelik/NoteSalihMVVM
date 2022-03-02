//
//  NoteDetailsViewModel.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

protocol NoteDetailsViewDataSource {
    var note: NoteTableViewCellModel? { get }
    var showType: ShowType { get set }
}

protocol NoteDetailsViewEventSource {}

protocol NoteDetailsViewProtocol: NoteDetailsViewDataSource, NoteDetailsViewEventSource {
    func createNote(note: NoteTableViewCellModel)
}

final class NoteDetailsViewModel: BaseViewModel<NoteDetailsRouter>, NoteDetailsViewProtocol {
    
    private let updateNoteList: ((NoteTableViewCellModel) -> Void)?
    var note: NoteTableViewCellModel?
    var showType: ShowType
    
    init(router: NoteDetailsRouter, note: NoteTableViewCellModel?, showType: ShowType, updateNoteList: ((NoteTableViewCellModel) -> Void)?) {
        self.note = note
        self.updateNoteList = updateNoteList
        self.showType = showType
        super.init(router: router)
    }
    
    func createNote(note: NoteTableViewCellModel) {
        switch showType {
        case .create:
            createNoteRequest(title: note.title, description: note.description)
        case .update:
            updateNoteRequest(note: note)
        }
    }
}

// MARK: - Network
extension NoteDetailsViewModel {
    
    private func createNoteRequest(title: String, description: String) {
        showLoading?()
        dataProvider.request(for: CreateNoteRequest(title: title, description: description)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                guard let responseTitle = response.data?.title,
                        let responseDescription = response.data?.note,
                        let responseId = response.data?.id
                else { return }
                let note = NoteTableViewCellModel(title: responseTitle, description: responseDescription, id: responseId)
                self.updateNoteList?(note)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    private func updateNoteRequest(note: NoteTableViewCellModel) {
        showLoading?()
        dataProvider.request(for: UpdateNoteRequest(title: note.title, description: note.description, id: note.id)) { [weak self] (result )in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                guard let responseTitle = response.data.title,
                        let responseDescription = response.data.note,
                        let responseId = response.data.id
                else { return }
                let note = NoteTableViewCellModel(title: responseTitle, description: responseDescription, id: responseId)
                self.updateNoteList?(note)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

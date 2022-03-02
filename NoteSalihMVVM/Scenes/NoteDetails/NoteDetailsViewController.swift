//
//  NoteDetailsViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

final class NoteDetailsViewController: BaseViewController<NoteDetailsViewModel> {
    
    private let stackView = UIStackViewBuilder()
        .spacing(19)
        .axis(.vertical)
        .build()
    private let titleTextField = AuthTextField()
    private let descriptionTextView = UITextViewBuilder().build()
    private let saveNoteButton = AuthButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLocalize()
        configureContents()
    }
}

// MARK: - UILayout
extension NoteDetailsViewController {
    
    private func addSubViews() {
        addMainStackView()
        addTitleNote()
        addDescriptionTextView()
        addSaveNoteButton()
    }
    
    private func addMainStackView() {
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 28, left: 20, bottom: 0, right: 20), usingSafeArea: true)
        stackView.height(400)
    }
    
    private func addSaveNoteButton() {
        view.addSubview(saveNoteButton)
        saveNoteButton.centerXToSuperview()
        saveNoteButton.bottomToSuperview(offset: -77, usingSafeArea: true)
        saveNoteButton.setHeight(42)
        saveNoteButton.width(140)
        
    }
    
    private func addTitleNote() {
        stackView.addArrangedSubview(titleTextField)
        titleTextField.font = .font(.josefinSansSemiBold, size: 22)
        titleTextField.textColor = .appEbonyClay
    }
    
    private func addDescriptionTextView() {
        stackView.addArrangedSubview(descriptionTextView)
        descriptionTextView.font = .font(.josefinSansRegular, size: 16)
        descriptionTextView.textColor = .appDarkGray
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.appLightGray.cgColor
    }
}

// MARK: - Configure & Set Localize
extension NoteDetailsViewController {
    
    private func configureContents() {
        saveNoteButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        switch viewModel.showType {
        case .create:
            title = L10n.NoteDetails.createNote
        case .update:
            title = L10n.NoteDetails.editNote
        }
        
        saveNoteButton.setTitle(L10n.NoteDetails.saveNote, for: .normal)
        
        guard let note = viewModel.note else { return }
        titleTextField.text = note.title
        descriptionTextView.text = note.description
    }
}

// MARK: - Actions
extension NoteDetailsViewController {
    
    @objc
    private func saveButtonTapped() {
        guard let title = titleTextField.text else { return }
        guard let description = descriptionTextView.text else { return }
        if let id = viewModel.note?.id {
            viewModel.createNote(note: NoteTableViewCellModel(title: title, description: description, id: id))
        } else {
            viewModel.createNote(note: NoteTableViewCellModel(title: title, description: description, id: 0))
        }
    }
}

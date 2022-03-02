//
//  NoteListViewController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 23.02.2022.
//

final class NoteListViewController: BaseViewController<NoteListViewModel> {
    
    private let refreshControl = UIRefreshControl()
    private let addNoteButton = AuthButton()
    private let noteTableView = UITableViewBuilder()
        .build()
    
    var navigationTitleView: UIView = {
        var view = UIView()
        let frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        view.frame = frame
        return view
    }()
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        searchBar.autocapitalizationType = .none
        searchBar.becomeFirstResponder()
        let frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        searchBar.frame = frame
        return searchBar
    }()
    var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        viewModel.getMyNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.setHidesBackButton(false, animated: true)
    }
}

// MARK: - UILayout
extension NoteListViewController {
    
    private func addSubViews() {
        addNoteTableView()
        addButton()
        addNavigationTitle()
    }
    
    private func addNoteTableView() {
        view.addSubview(noteTableView)
        noteTableView.edgesToSuperview(excluding: .top)
        noteTableView.topToSuperview(usingSafeArea: true)
    }
    
    private func addButton() {
        view.addSubview(addNoteButton)
        addNoteButton.centerXToSuperview()
        addNoteButton.bottomToSuperview(offset: -77, usingSafeArea: true)
        addNoteButton.setHeight(42)
        addNoteButton.width(140)
    }
    
    private func addNavigationTitle() {
        navigationTitleView.addSubview(searchBar)
        navigationTitleView.centerInSuperview()
    }
}

// MARK: - Configure & Set Localize
extension NoteListViewController {
    
    private func configureContents() {
        configureNoteTableView()
        configureAddNoteButton()
        configureSearchBar()
        configureNavigationItems()
        configureSingleTapGesture()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    private func configureNoteTableView() {
        noteTableView.delegate = self
        noteTableView.dataSource = self
        noteTableView.refreshControl = refreshControl
        noteTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.defaultReuseIdentifier)
    }
    
    private func configureAddNoteButton() {
        addNoteButton.addTarget(self, action: #selector(addNoteButtonTapped), for: .touchUpInside)
        addNoteButton.titleLabel?.font = .font(.josefinSansSemiBold, size: 13)
        addNoteButton.setImage(.icAdd.withRenderingMode(.alwaysTemplate), for: .normal)
        addNoteButton.contentEdgeInsets = .init(top: 13, left: 12, bottom: 13, right: 12)
        addNoteButton.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        addNoteButton.imageEdgeInsets = .init(top: 0, left: -12, bottom: 0, right: 0)
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 5
        searchBar.layer.borderColor = UIColor.appLightGray.cgColor
    }
    
    private func configureNavigationItems() {
        let rightBarItem = UIView()
        rightBarItem.backgroundColor = .black
        rightBarItem.layer.cornerRadius = 15
        rightBarItem.layer.borderWidth = 2
        rightBarItem.layer.borderColor = UIColor.blue.cgColor
        rightBarItem.height(30)
        rightBarItem.aspectRatio(1)
        
        let leftIcon = UIBarButtonItem(image: .icHamburger, style: .plain, target: self, action: nil)
        let rightIcon = UIBarButtonItem(customView: rightBarItem)
        
        navigationItem.leftBarButtonItems = [leftIcon]
        navigationItem.rightBarButtonItems = [rightIcon]
        navigationItem.titleView = navigationTitleView
    }
    
    private func configureSingleTapGesture() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    private func setLocalize() {
        addNoteButton.setTitle(L10n.NoteList.addNote, for: .normal)
    }
}

// MARK: - SubscribeViewModel
extension NoteListViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.viewModel.page = 1
            DispatchQueue.main.async {
                self?.viewModel.hideActivityIndicatorView?()
            }
            self?.noteTableView.reloadData()
        }
        viewModel.didUpdateTableViewRow = { [weak self] indexPath in
            self?.noteTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - Actions
extension NoteListViewController {
    
    @objc
    private func addNoteButtonTapped() {
        viewModel.addNoteButtonTapped()
    }
    
    @objc
    private func pullToRefresh() {
        viewModel.getMyNotes()
        self.refreshControl.endRefreshing()
    }
    
    @objc
    func singleTap(sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
    }
}

// MARK: - UITableViewDataSource
extension NoteListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchText.isEmpty {
            return viewModel.numberOfItems
            
        }
        return viewModel.numberOfFilteredItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.defaultReuseIdentifier, for: indexPath) as? NoteTableViewCell
        else { return UITableViewCell() }
        let cellItem: NoteTableViewCellProtocol
        if viewModel.isEmptyFilteredItems {
            cellItem = viewModel.cellItemAt(indexPath: indexPath, type: .normal)
        } else {
            cellItem = viewModel.cellItemAt(indexPath: indexPath, type: .filtered)
        }
        cell.setupCell(with: cellItem)
        return cell
    }
}

// swiftlint:disable line_length
// MARK: - UITableViewDelegate
extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.5
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteButton = UIContextualAction(style: .destructive, title: "") { [weak self] (_, _, _) in
            guard let self = self else { return }
            let alert = UIAlertController(title: L10n.NoteList.deleteNote, message: L10n.NoteList.deleteAlertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: L10n.NoteList.cancel, style: .default, handler: { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: L10n.NoteList.delete, style: .default, handler: { [weak self] _ in
                self?.viewModel.deleteButtonTapped(at: indexPath)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        deleteButton.image = .icTrash
        deleteButton.backgroundColor = .appRed
        
        let editButton = UIContextualAction(style: .normal, title: "") { [weak self] (_, _, _) in
            self?.viewModel.editButtonTapped(at: indexPath)
        }
        editButton.backgroundColor = .appYellow
        editButton.image = .icEdit
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteButton, editButton])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
        if position > noteTableView.contentSize.height - 100 - scrollView.frame.size.height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            self.viewModel.showActivityIndicatorView?(.bottom)
            viewModel.getMyNotes()
        }
    }
}

// MARK: - UISearchBarDelegate
extension NoteListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchBar.layer.borderColor = UIColor.appLightGray.cgColor
        } else {
            searchBar.layer.borderColor = UIColor.appBlue.cgColor
        }
        self.searchText = searchText
        viewModel.searchText(text: searchText) {
            self.noteTableView.reloadData()
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.searchBarStyle = .minimal
    }
}

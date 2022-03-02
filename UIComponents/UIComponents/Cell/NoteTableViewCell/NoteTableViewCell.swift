//
//  NoteTableViewCell.swift
//  UIComponents
//
//  Created by Mehmet Salih ÇELİK on 24.02.2022.
//

public class NoteTableViewCell: UITableViewCell, ReusableView {
    
    public static var defaultReuseIdentifier = "noteCell"
    
    weak var viewModel: NoteTableViewCellProtocol?
    
    private let stackView = UIStackViewBuilder()
        .spacing(12)
        .axis(.vertical)
        .build()
    private let titleLabel = UILabelBuilder()
        .font(.font(.josefinSansSemiBold, size: 13))
        .textColor(.appEbonyClay)
        .numberOfLines(1)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 13))
        .textColor(.appDarkGray)
        .numberOfLines(2)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    public func setupCell(with viewModel: NoteTableViewCellProtocol) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
    }
}

// MARK: - UILayout
extension NoteTableViewCell {
    
    private func addSubViews() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .init(top: 25, left: 20, bottom: 20, right: 20))
        
        stackView.addArrangedSubview(titleLabel)
        titleLabel.setHugging(.required, for: .vertical)
        
        stackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.setHugging(.defaultLow, for: .vertical)
    }
}

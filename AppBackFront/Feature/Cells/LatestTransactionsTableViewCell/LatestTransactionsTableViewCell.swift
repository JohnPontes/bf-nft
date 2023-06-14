//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by John Pontes on 12/06/23.
//

import UIKit

class LatestTransactionsTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: LatestTransactionsTableViewCell.self)
    var viewModel: LatestTransactionsTableViewCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        viewModel = LatestTransactionsTableViewCellViewModel()
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: LatestTransactionsTableViewCellScreen = {
        let view = LatestTransactionsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    public func setupCell(data: LatestTransactionsCell) {
        viewModel?.setLatestTransactions(data: data)
        screen.titleLabel.text = viewModel?.title
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionTableViewCell.identifier, for: indexPath) as? ListOfTransactionTableViewCell
        cell?.setupCell(data: viewModel?.loadCurrentLatestDeal(indexPath: indexPath) ?? ListOfTransaction(), isInitial: viewModel?.isInitial(indexPath: indexPath) ?? false, isFinal: viewModel?.isFinal(indexPath: indexPath) ?? false)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRowAt ?? 0
    }
    
}


//
//  LastestDealTableViewCell.swift
//  AppBackFront
//
//  Created by John Pontes on 20/05/23.
//

import UIKit

class LastestDealTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: LastestDealTableViewCell.self)
    var viewModel: LastestDealTableViewCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        viewModel = LastestDealTableViewCellViewModel()
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: LastestDealTableViewCellScreen = {
        let view = LastestDealTableViewCellScreen()
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
    
    public func setupCell(data: Nft) {
        viewModel?.setNFt(nft: data)
        screen.titleLabel.text = viewModel?.title
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension LastestDealTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOffersTableViewCell.identifier, for: indexPath) as? ListOffersTableViewCell
        cell?.setupCell(data: viewModel?.loadCurrentLatestDeal(indexPath: indexPath) ?? LatestDeal(), isInitial: viewModel?.isInitial(indexPath: indexPath) ?? false, isFinal: viewModel?.isFinal(indexPath: indexPath) ?? false)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRowAt ?? 0
    }
    
}

//
//  NftTableViewCell.swift
//  AppBackFront
//
//  Created by John Pontes on 03/05/23.
//

import UIKit
import AlamofireImage

class NftTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: NftTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: NftTableViewCellScreen = {
        let view = NftTableViewCellScreen()
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
        if let urlNFT: URL = URL(string: data.nftImage ?? ""), let urlUser: URL = URL(string: data.userImage ?? "") {
            screen.nftImageView.af.setImage(withURL: urlNFT, placeholderImage: UIImage(named: "threeButtons"))
            screen.nftImageView.backgroundColor = .white
            
            screen.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill"))
            screen.userImageView.backgroundColor = .white
        }
        
        screen.priceLabel.text = data.price
        screen.priceValueLabel.text = "\(data.nftPrice ?? 0.0) ETH"
        screen.ownedByPriceLabel.text = data.ownedBy
        screen.userLabel.text = data.userName
    }
    
}

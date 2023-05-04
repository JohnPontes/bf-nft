//
//  NftTableViewCellScreen.swift
//  AppBackFront
//
//  Created by John Pontes on 03/05/23.
//

import UIKit

class NftTableViewCellScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        
        return view
    }()
    
    lazy var nftImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        
        return img
    }()
    
    lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 24
        img.tintColor = .black
        
        return img
    }()
    
    lazy var ownedByPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    private func addElements() {
        addSubview(viewBackground)
        viewBackground.addSubview(nftImageView)
        viewBackground.addSubview(userImageView)
        viewBackground.addSubview(ownedByPriceLabel)
        viewBackground.addSubview(userLabel)
        viewBackground.addSubview(priceLabel)
        viewBackground.addSubview(priceValueLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 340),
            
            nftImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            nftImageView.heightAnchor.constraint(equalToConstant: 270),
            
            userImageView.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 8),
            userImageView.widthAnchor.constraint(equalToConstant: 48),
            userImageView.heightAnchor.constraint(equalToConstant: 48),
            
            ownedByPriceLabel.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 20),
            ownedByPriceLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            
            userLabel.topAnchor.constraint(equalTo: ownedByPriceLabel.bottomAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),

            priceLabel.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15),
            
            priceValueLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            priceValueLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15)
            
        ])
    }
}

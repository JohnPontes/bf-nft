//
//  NftViewCellScreen.swift
//  AppBackFront
//
//  Created by John Pontes on 15/05/23.
//

import UIKit

protocol NftImageTableViewCellScreenDelegate: AnyObject {
    func tappedCloseButton()
    func tappedMagnifyingGlassButton()
}

class NftImageTableViewCellScreen: UIView {
    
    private weak var delegate: NftImageTableViewCellScreenDelegate?
    
    public func delegate(delegate: NftImageTableViewCellScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.tintColor = .white
        
        return img
    }()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var magnifyingGlassButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.addTarget(self, action: #selector(tappedmagnifyingGlassButton), for: .touchUpInside)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedCloseButton() {
        delegate?.tappedCloseButton()
    }
    
    @objc private func tappedmagnifyingGlassButton() {
        delegate?.tappedMagnifyingGlassButton()
    }
    
    private func addViews() {
        addSubview(imageView)
        addSubview(closeButton)
        addSubview(magnifyingGlassButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}

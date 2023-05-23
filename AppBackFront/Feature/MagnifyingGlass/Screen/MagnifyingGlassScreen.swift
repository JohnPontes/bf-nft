//
//  MagnifyingGlassScreen.swift
//  AppBackFront
//
//  Created by John Pontes on 22/05/23.
//

import UIKit

protocol MagnifyingGlassScreenDelegate: AnyObject {
    func tappedBackButton()
}

class MagnifyingGlassScreen: UIView {
    
    private weak var delegate: MagnifyingGlassScreenDelegate?
    
    public func delegate(delegate: MagnifyingGlassScreenDelegate) {
        self.delegate = delegate
    }
    
    lazy var nftImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        
        return img
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return btn
    }()
    
    @objc private func tappedBackButton() {
        self.delegate?.tappedBackButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(nftImageView)
        addSubview(backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            
        ])
    }
    
}

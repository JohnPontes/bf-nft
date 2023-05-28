//
//  QuotationEthTableViewCell.swift
//  AppBackFront
//
//  Created by John Pontes on 28/05/23.
//

import UIKit

class QuotationEthTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: QuotationEthTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: QuotationEthTableViewCellScreen = {
        let view = QuotationEthTableViewCellScreen()
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
    
    public func setupCell(data: QuotationEthereum) {
        screen.ethValueLabel.text = "\(data.ethValue ?? 0) ETH"
        screen.ethValueDollarsLabel.text = "$ \(data.valueInDollars ?? 0)"
        screen.coinEthImageView.image = UIImage(named: data.coinEthImage ?? "")
    }


}

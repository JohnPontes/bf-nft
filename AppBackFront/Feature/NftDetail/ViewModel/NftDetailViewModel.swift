//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by John Pontes on 15/05/23.
//

import UIKit

class NftDetailViewModel {
    let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNft: Int {
        return nft.nftID ?? 0
    }
    
    public var titleNft: String {
        return nft.nftNameImage ?? ""
    }
    
    public var descriptionNft: String {
        return nft.nftDescription ?? ""
    }
    
    public func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NameCellNftDetail(rawValue: indexPath.row) {
        case .nftImage:
            return 400
            
        case .description:
            let totalLabel = descriptionNft.height(withConstrainedWidth: width - 40, font: UIFont.systemFont(ofSize: 18)) + 89
            return totalLabel
            
        case .lastestDeal:
            return HeightLatestDeal.height.rawValue * CGFloat(nft.latestDeals?.count ?? 0) + 75
            
        default:
            return 0
        }
    }
}

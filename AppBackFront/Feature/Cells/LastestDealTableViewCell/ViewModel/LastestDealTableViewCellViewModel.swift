//
//  LastestDealTableViewCellViewModel.swift
//  AppBackFront
//
//  Created by John Pontes on 20/05/23.
//

import UIKit

enum HeightLatestDeal: CGFloat {
    case height = 70
}

class LastestDealTableViewCellViewModel {
    var nft: Nft?
    
    public func setNFt(nft: Nft) {
        self.nft = nft
    }
    
    public var title: String {
        return nft?.titleLatestDeals ?? ""
    }
    
    public var numberOfRowsInSection: Int {
        return nft?.latestDeals?.count ?? 0
    }
    
    public var heightForRowAt: CGFloat {
        return HeightLatestDeal.height.rawValue
    }
    
    public func loadCurrentLatestDeal(indexPath: IndexPath) -> LatestDeal {
        return nft?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    
    public func isInitial(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    public func isFinal(indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
}

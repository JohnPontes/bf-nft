//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by John Pontes on 27/04/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    private let homeService: HomeService = HomeService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    weak private var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            homeService.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
            
        case .request:
            homeService.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    //MARK: FilterCollectionView
    public var numberOfItemsInSection: Int {
        return searchNftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(index: IndexPath) -> FilterNft {
        return searchNftData?.filterListNft?[index.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    //MARK: NftTableViewCell
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(index: IndexPath) -> Nft {
        return searchNftData?.nftList?[index.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    
    
    //MARK: FILTER
    
    public func filterSearchText(text: String) {
        if !text.isEmpty {
            searchNftData?.nftList = nftData?.nftList?.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        } else {
            searchNftData?.nftList = nftData?.nftList
        }

    }
    
}

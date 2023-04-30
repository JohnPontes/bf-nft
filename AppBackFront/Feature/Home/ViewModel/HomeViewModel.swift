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
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
        

    }
}

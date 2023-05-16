//
//  HomeVC.swift
//  AppBackFront
//
//  Created by John Pontes on 24/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var homeViewModel: HomeViewModel?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        homeScreen?.configSearchBarProtocols(delegate: self)
        homeViewModel?.delegate(delegate: self)
        homeViewModel?.fetchRequest(.request)
    }
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        print(#function)
        DispatchQueue.main.async {
            self.homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.tableView.reloadData()
        }
    }
    
    func error() {
        print(#function)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.numberOfItemsInSection ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell
        if let filterNft = homeViewModel?.loadCurrentFilterNft(index: indexPath) {
            cell?.setupCell(filter: filterNft)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return homeViewModel?.sizeForItemAt ?? CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewModel?.setFilter(indexPath: indexPath, searchText: homeScreen?.searchBar.text ?? "")
        homeScreen?.collectionView.reloadData()
        homeScreen?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        homeScreen?.tableView.reloadData()
        if homeViewModel?.numberOfRowsInSection ?? 0 > 0 {
            homeScreen?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier, for: indexPath) as? NftTableViewCell
        
        cell?.setupCell(data:homeViewModel?.loadCurrentNft(index: indexPath) ?? Nft())
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeViewModel?.heightForRowAt ?? CGFloat()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dataCurrent = homeViewModel?.loadCurrentNft(index: indexPath) {
            let nftDetail = NftDetailVC(nft: dataCurrent)
            present(nftDetail, animated: true)
        }
        
        
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homeViewModel?.filterSearchText(text: searchText)
        homeScreen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
}


//
//  HomeService.swift
//  AppBackFront
//
//  Created by John Pontes on 27/04/23.
//

import UIKit;
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/fc6566e9-fbc5-4dbb-a1b2-750a58b6c3ab"
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let success):
                print("SUCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }

    func getHomeFromJson (completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion (nftData, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed (name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
    
    
}

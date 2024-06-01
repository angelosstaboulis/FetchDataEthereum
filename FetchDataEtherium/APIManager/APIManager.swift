//
//  APIManager.swift
//  FetchDataEtherium
//
//  Created by Angelos Staboulis on 2/6/24.
//

import Foundation
import web3
actor APIManager{
    func fetchData(urlString:String,completion:@escaping ((FetchData)->())){
        Task{
            guard let urlString = URL(string: urlString) else {
                return
            }
            let client = EthereumHttpClient(url: urlString , network: .mainnet)
            let gasPrice = try await client.eth_gasPrice()
            completion(FetchData(gasPrice: gasPrice))
        }
    }
}

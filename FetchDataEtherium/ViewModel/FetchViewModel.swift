//
//  FetchViewModel.swift
//  FetchDataEtherium
//
//  Created by Angelos Staboulis on 2/6/24.
//

import Foundation
import web3
class FetchViewModel:ObservableObject{
    let fetchDataServices = APIManager()
    func fetchData(urlString:String,completion:@escaping ((FetchData)->())){
        Task{
            await fetchDataServices.fetchData(urlString: urlString) { fetchData in
                completion(fetchData)
            }
        }
    }
}

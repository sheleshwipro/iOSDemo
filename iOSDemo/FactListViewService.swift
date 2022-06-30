//
//  FactViewService.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation
class FactListViewService {
    func fetchFact(completion:@escaping (Result<FactListModel, MyError>)->Void){
        guard let url = URL(string:"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {
            completion(.failure(.BadURL))
            return
        }
      
        NetworkManager().fetchRequest(url:url, modelType:FactListModel.self, completion:{ result in
            switch(result){
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

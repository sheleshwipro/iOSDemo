//
//  FactListViewModel.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation

protocol FactListViewModelProtocol {
    var factList:Observable<FactListModel> {get set}
    var error:Observable<Bool> {get set}
    var errorType:Observable<MyError> {get set}
    
    func fetchFactList(completion: @escaping (Result<FactListModel, MyError>)->Void)
}

class FactListViewModel:FactListViewModelProtocol {
    var factList:Observable<FactListModel> = Observable(FactListModel(title: "", rows: [FactModel]()))
    var error:Observable<Bool> = Observable(false)
    var errorType: Observable<MyError> = Observable(.Undefined)
    
    func fetchFactList(completion:@escaping (Result<FactListModel, MyError>)->Void){
        FactListViewService().fetchFact { (result) in
            switch(result){
            case .success(let model):
                self.factList.value = model
            case .failure(let error):
                self.errorType.value = error
                self.error.value = true
            }
        }
    }
}

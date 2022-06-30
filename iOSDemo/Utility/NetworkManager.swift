//
//  NetworkManager.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation

enum MyError:Error {
    case Undefined
    case BadURL
    case NoData
    case DecodingError
}


class NetworkManager{
    private var apiHandler:APIHandlerDelegate
    private var responseHandler:ResponseHandlerDelegate
    
    init(apiH:APIHandlerDelegate = APIHandler(), respH:ResponseHandlerDelegate = ResponseHandler()) {
        self.apiHandler = apiH
        self.responseHandler = respH
    }
    func fetchRequest<T:Codable>(url:URL, modelType:T.Type, completion:@escaping (Result<T,MyError>)->Void){
      
        apiHandler.fetchData(url: url) { (result) in
            switch result{
            case .failure(let error) :
                completion(.failure(error))
            case .success(let data) :
                self.responseHandler.fetchModel(data: data, type: modelType, completion: { (resultModel) in
                    switch resultModel{
                    case .failure(let error):
                        completion(.failure(error))
                    case .success(let model):
                        completion(.success(model))
                    }
                })
             
            default:
                break
            }
        }
    }
}

protocol APIHandlerDelegate {
    func fetchData(url:URL, completion:@escaping (Result<Data, MyError>)->Void)
}
protocol ResponseHandlerDelegate {
    func fetchModel<T:Codable>(data:Data,type:T.Type, completion:@escaping (Result<T, MyError>)->Void)
}

class APIHandler:APIHandlerDelegate{
    func fetchData(url:URL, completion:@escaping (Result<Data, MyError>)->Void){
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.NoData))
                return
            }
            completion(.success(data))
                        
        }.resume()
    }
}
class ResponseHandler:ResponseHandlerDelegate{
    func fetchModel<T:Codable>(data:Data,type:T.Type, completion:(Result<T, MyError>)->Void){

        #error("Below commented code is not able to decode the received data from the server so i had to add json data in local data.json file and displaying on to UI. Please comment out this error and code will run")
//        if let model = try? JSONDecoder().decode(type.self, from: data){
//            completion(.success(model))
//        }else{
//            completion(.failure(.DecodingError))
//        }

        if let path = Bundle.main.path(forResource: "data", ofType: "json"){
            do {
                let contents = try String(contentsOfFile: path)
                let d2 = Data(contents.utf8)
                do {
                    if let model = try? JSONDecoder().decode(type.self, from: d2){
                        completion(.success(model))
                    }else{
                        completion(.failure(.DecodingError))
                    }
                   
                } catch let er {
                    print(er.localizedDescription)
                }
                
            } catch let err{
                // contents could not be loaded
                print(err.localizedDescription)
            }
        } else {
            // example.txt not found!
            print("invalid path")
        }
 
    }
}

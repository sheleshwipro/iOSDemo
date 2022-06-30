//
//  Observable.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation
struct Observable<T> {
    private var listner:((T)->Void)?
    var value:T {
        didSet{
            listner?(value)
        }
    }
    init(_ value:T) {
        self.value = value
    }
    mutating func bind(_ closure:@escaping (T)->Void){
        self.listner = closure
        listner?(value)
    }
}

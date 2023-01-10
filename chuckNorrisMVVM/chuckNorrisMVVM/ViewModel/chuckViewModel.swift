//
//  chuckViewModel.swift
//  chuckNorrisMVVM
//
//  Created by Mario Alberto Saldana Martinez on 20/10/22.
//

import Foundation
import Combine

class ChuckViewModel {
    fileprivate var fraseResponse: String {
        didSet{
            dataChuckView.send(fraseResponse)
        }
    }
    
    public var dataChuckView = PassthroughSubject<String, Never>()//publisher
    
    init() {
        self.fraseResponse = ""
    }
    
}

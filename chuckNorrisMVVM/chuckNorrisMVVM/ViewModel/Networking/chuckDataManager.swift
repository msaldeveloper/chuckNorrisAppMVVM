//
//  chuckNetworking.swift
//  chuckNorrisMVVM
//
//  Created by Mario Alberto Saldana Martinez on 20/10/22.
//

import Foundation
import Alamofire
import Combine

let urlBase = "\(urls.base.urlBase)\(urls.tipeJoke.random)"


class DataResponse {
    func chuckDataResponse() -> DataResponsePublisher<chuckModel> {
        print("urlBase:",urlBase)
        return AF
            .request(urlBase,method: .get)
            .response { fulldata in
                debugPrint(fulldata)
            }
            .validate()
            .publishDecodable(type: chuckModel.self)
    }
}


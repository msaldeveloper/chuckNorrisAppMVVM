//
//  chuckNetworking.swift
//  chuckNorrisMVVM
//
//  Created by Mario Alberto Saldana Martinez on 20/10/22.
//

import Foundation
import Alamofire
import Combine

let urlBase = "\(urls.base())\(urls.tipeJoke.random)"


class dataResponse {
    func chuckDataResponse() -> DataResponsePublisher<chuckModel> {
        return AF
            .request(urlBase, method: .get)
            .response { fulldata in
                debugPrint(fulldata)
            }
            .validate()
            .publishDecodable(type: chuckModel.self)
    }
}


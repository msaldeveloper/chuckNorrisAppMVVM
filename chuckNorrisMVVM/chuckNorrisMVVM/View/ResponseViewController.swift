//
//  ResponseViewController.swift
//  chuckNorrisMVVM
//
//  Created by Mario Alberto Saldana Martinez on 20/10/22.
//

import Foundation
import UIKit
import Combine

class ResponseViewController: UIViewController{
        
    var image : UIImageView?
    var fraseLabel : UILabel?
    //variable para mandar llamar el data manager
    var dataResponse = DataResponse()
    // cancelable para suscriptor
    private var cancellables : [AnyCancellable] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUi()
        view.backgroundColor = UIColor.random
        
    }
    
    func initUi(){
        
        image = UIImageView()
        image?.image = UIImage(named: "")
        let urlImage = "https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png"
        if let url = NSURL(string: urlImage) {
            print(type(of: url), url)
            if let data = NSData(contentsOf: url as URL) {
                self.image?.image = UIImage(data: data as Data)
                self.image?.layer.cornerRadius = 10
                self.image?.layer.masksToBounds = true
          }
        }
        view.addSubview(image!)
        image?.addAnchorsAndSize(width: nil, height: 200, left: 35, top: 150, right: 35, bottom: nil)
        
        fraseLabel = UILabel()
        fraseLabel?.numberOfLines = 0
        fraseLabel?.sizeToFit()
        //fraseLabel?.text = "hola"
        //fraseLabel?.font = UIFont.textFont2
        fraseLabel?.backgroundColor = .clear
        fraseLabel?.textAlignment = .center
        view.addSubview(fraseLabel!)
        fraseLabel?.addAnchorsAndSize(width: nil, height: 140, left: 10, top: 15, right: 10, bottom: nil, withAnchor: .top, relativeToView: image)
        userLogin()
    }
    public func userLogin(){
        dataResponse.chuckDataResponse().sink{ response in
            print("@@@@@@",response.value?.value)
            self.fraseDeployer(response.value?.value ?? "")
            
        }.store(in: &cancellables)
    }
    func fraseDeployer(_ prase2: String){
        print(prase2)
        fraseLabel?.text = prase2
    }
}
//extension ResponseViewController: ChuckViewDelegate {
//    func recivePhrase(_ message: String) {
//        self.fraseLabel?.text = message
//    }
//}

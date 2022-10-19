//
//  ViewController.swift
//  chuckNorrisMVVM
//
//  Created by Mario Alberto Saldana Martinez on 28/09/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var image : UIImageView?
    var button : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
        initUI()
    }
    private func initUI(){
        titleLabelText()
        descriptionLabelText()
        logoImages()
        accessButton()
    }
    func titleLabelText(){
        titleLabel = UILabel()
        titleLabel?.text = "ChukNorris API"
        titleLabel?.font = UIFont.init(name: "bold", size: 22)
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        view.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 60, right: 10, bottom: nil)
    }
    
    func descriptionLabelText(){
        descriptionLabel = UILabel()
        descriptionLabel?.text = "frases de CHUCK NORRIS"
        descriptionLabel?.font = UIFont.init(name: "bold", size: 30)
        descriptionLabel?.backgroundColor = .clear
        descriptionLabel?.textAlignment = .center
        view.addSubview(descriptionLabel!)
        descriptionLabel?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 15, right: 10, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
    }
    
    func logoImages(){
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
        image?.addAnchorsAndSize(width: nil, height: 250, left: 10, top: 80, right: 10, bottom: nil, withAnchor: .top, relativeToView: descriptionLabel)
    }
    
    func accessButton(){
        button = UIButton()
        button?.backgroundColor = UIColor(red: 109/255, green: 69/255, blue: 223/255, alpha: 1)
        button?.setTitle("Buscar", for: .normal)
        button?.layer.cornerRadius = 10
        view.addSubview(button!)
        button?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 140, right: 10, bottom: nil, withAnchor: .top, relativeToView: image)
    }


}


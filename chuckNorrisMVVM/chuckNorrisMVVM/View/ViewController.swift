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
    var responseViewController = ResponseViewController()
    var categoriesBox : UITextField = UITextField()
    var categoriesField: UIView?
    
    //variable para suscriptor
    private var chuckviewModel = ChuckViewModel()
    
    // cancelable para suscriptor
    private var cancellables : [AnyCancellable] = []
    
    
    
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
        categoriesTextBox()
    }
    func titleLabelText(){
        titleLabel = UILabel()
        titleLabel?.text = NSLocalizedString("welcomeScreen.appName", comment: "app name")
        titleLabel?.font = UIFont.init(name: "bold", size: 22)
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        view.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 60, right: 10, bottom: nil)
    }
    
    func descriptionLabelText(){
        descriptionLabel = UILabel()
        descriptionLabel?.text = NSLocalizedString("welcomeScreen.title", comment: "title")
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
        button?.setTitle(NSLocalizedString("welcomeScreen.findButton.text", comment: "button text") , for: .normal)
        button?.layer.cornerRadius = 10
        view.addSubview(button!)
        button?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 140, right: 10, bottom: nil, withAnchor: .top, relativeToView: image)
        let tapSearcherButton = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        button?.addGestureRecognizer(tapSearcherButton)
    }
    
    func categoriesTextBox(){
        categoriesField = UIView()
        categoriesField?.tintColor = UIColor.red
        view.addSubview(categoriesField!)
        categoriesField?.addAnchorsAndSize(width: nil, height:nil, left: 21, top: 10 , right: 21, bottom: nil, withAnchor: .top, relativeToView: button)
                
                
        
               
    }

    
    @objc func buttonAction(){
        //responseViewController.userLogin()
        let resposeViewController = ResponseViewController()
        present(resposeViewController,animated: true,completion:{print("register button press validated")} )
        }
    
    

    
    func actionButton(){
         
    }


}


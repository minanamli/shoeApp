//
//  shoeModelViewController.swift
//  shoesApp
//
//  Created by Mina Namlı on 12.05.2022.
//

import UIKit
import SnapKit
import PassKit

class shoeModelViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate{

    var selectedShoeModelName = ""
    var selectedShoeBrandName = ""
    var selectedShoePrice = Int()
    var selectedShoeImage = UIImage()
    
    let shoeImage : UIImageView = {
       let img = UIImageView()
       return img
    }()
    
    let shoeModelName : UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20)
        return lbl}()
    
    let shoeBrandName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 28)
        return lbl}()
    
    let shoePrice: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20)
        return lbl}()
    
    let payButton : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 0
        btn.backgroundColor = .darkGray
        return btn}()
    
    private var paymentRequest : PKPaymentRequest = {
           let request = PKPaymentRequest()
           request.merchantIdentifier = "merchant.com.pushpendra.pay"
           request.supportedNetworks = [.quicPay, .masterCard, .visa]
           request.supportedCountries = ["US"]
           request.merchantCapabilities = .capability3DS
           request.countryCode = "US"
           request.currencyCode = "USD"
           return request
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        shoeImage.contentMode = UIView.ContentMode.scaleAspectFit
        shoeImage.frame.size.width = 200
        shoeImage.frame.size.height = 200
        shoeImage.center = self.view.center
        
        super.view.addSubview(shoeImage)
        
        
        super.view.addSubview(shoeBrandName)
        shoeBrandName.textColor = .black
        shoeBrandName.snp.makeConstraints{ make -> Void in
           make.edges.equalTo(super.view).inset(UIEdgeInsets(top: 400, left: 140, bottom: 200, right: 50))
       }
        
        super.view.addSubview(shoeModelName)
        shoeModelName.textColor = .black
        shoeModelName.snp.makeConstraints{ make -> Void in
           make.edges.equalTo(super.view).inset(UIEdgeInsets(top: 450, left: 140, bottom: 200, right: 50))
       }
        
        super.view.addSubview(shoePrice)
        shoePrice.textColor = .black
        shoePrice.snp.makeConstraints{ make -> Void in
           make.edges.equalTo(super.view).inset(UIEdgeInsets(top: 500, left: 150, bottom: 200, right: 50))
       }
        
        
        super.view.addSubview(shoeImage)
        shoeImage.contentMode = UIView.ContentMode.scaleAspectFit
        shoeImage.image = UIImage(named: "firstimg.png")
        shoeImage.snp.makeConstraints{ make -> Void in
            make.right.equalToSuperview().offset(-80)
            make.left.equalToSuperview().offset(80)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.height.equalTo(300)
            
        }
        
        super.view.addSubview(payButton)
        payButton.setTitle("Buy", for: .normal)
        payButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(600)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(120)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-120)
        }
        
        payButton.addTarget(self, action: #selector(tapForPay), for: .touchUpInside)
        
        shoeModelName.text = selectedShoeModelName
        shoeImage.image = selectedShoeImage
        shoeBrandName.text = selectedShoeBrandName

        
    }
    
    @objc func tapForPay(payButton: UIButton, sender : Any){
        let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
        paymentRequest.paymentSummaryItems = [PKPaymentSummaryItem(label: "Click for Pay", amount: NSDecimalNumber(value: selectedShoePrice))]
                if controller != nil {
                    controller!.delegate = self
                    present(controller!, animated: true, completion: nil)
                }else {
                    makeAlert(titleInput: "Try Again", messageInput: "Cancel")
                    }
    }

    @objc func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
    }

    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput , message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }

 

}

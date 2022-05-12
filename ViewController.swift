
import UIKit
import SnapKit

class ViewController: UIViewController {

    var fisrtLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Trendy Shoes for Every Feet"
        lbl.font = .systemFont(ofSize: 40.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 3
        return lbl}()
    
    var firstImage : UIImageView = {
       let img = UIImageView()
       return img
    }()
    
    var firstCaption : UILabel = {
       let lbl = UILabel()
        lbl.text = "  This is the address you are looking for to find the latest fashion and the most useful shoes suitable for everyone"
        lbl.font = .systemFont(ofSize: 15)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 4
        return lbl}()
    
    let startButton : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 0
        btn.backgroundColor = .darkGray
        return btn}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .white
        
        super.view.addSubview(fisrtLabel)
            fisrtLabel.snp.makeConstraints{ make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-85)
        }
        
        super.view.addSubview(firstImage)
        firstImage.contentMode = UIView.ContentMode.scaleAspectFit
        firstImage.image = UIImage(named: "firstimg.png")
        firstImage.snp.makeConstraints{ make -> Void in
            make.right.equalToSuperview().offset(-100)
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
            make.height.equalTo(350)}
        
        super.view.addSubview(firstCaption)
        firstCaption.snp.makeConstraints{ make -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(550)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-25)
        }
        
        super.view.addSubview(startButton)
        startButton.setTitle("START", for: .normal)
        startButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(650)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(70)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-70)
            make.height.equalTo(45)
        }
        
        startButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked(startButton: UIButton, sender : Any){
        let nextVC = ShoppingTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    

}


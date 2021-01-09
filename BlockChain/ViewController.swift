//
//  ViewController.swift
//  BlockChain
//
//  Created by denzel banegas on 09/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let firstAccount = 1010
    let secondAccount = 1011
    let bitcoinChain = Blockchain()
    let reward = 100
    var accounts: [String: Int] = ["0000" : 1000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction", message: "Please check the details of your transaction", preferredStyle: .alert)
    
    let topNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Denzel"
        label.textColor = .mainPurleColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let bottomNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Anand"
        label.textColor = .mainPurleColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let topAmountTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        tf.rightViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        tf.autocapitalizationType = .none
        tf.borderStyle = .none
        tf.textColor = .white
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tf.backgroundColor = UIColor.lightPurpleColor
        tf.attributedPlaceholder = NSAttributedString(string: "Enter Amount", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        tf.contentHorizontalAlignment = .leading
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    let bottomAmountTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        tf.rightViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        tf.autocapitalizationType = .none
        tf.borderStyle = .none
        tf.textColor = .white
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tf.backgroundColor = UIColor.lightPurpleColor
        tf.attributedPlaceholder = NSAttributedString(string: "Enter Amount", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        tf.contentHorizontalAlignment = .leading
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    let topMine: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .mainPurleColor
        btn.setTitle("Mine", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.addTarget(self, action: #selector(greenMineTapped), for: .touchUpInside)
        return btn
    }()
    
    let topSend: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .mainPurleColor
        btn.setTitle("Send", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.addTarget(self, action: #selector(greenSendTapped), for: .touchUpInside)
        return btn
    }()
    
    let bottomMine: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .mainPurleColor
        btn.setTitle("Mine", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.addTarget(self, action: #selector(redMineTapped), for: .touchUpInside)
        return btn
    }()
    
    let bottomSend: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .mainPurleColor
        btn.setTitle("Send", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.addTarget(self, action: #selector(redSendTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var topBtnStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(topMine)
        sv.addArrangedSubview(topSend)
        sv.spacing = 10
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        return sv
    }()
    
    lazy var bottomBtnStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(bottomMine)
        sv.addArrangedSubview(bottomSend)
        sv.spacing = 10
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        return sv
    }()
    
    lazy var topLabelStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(topNameLabel)
        sv.addArrangedSubview(topLabel)
        sv.spacing = 10
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .leading
        return sv
    }()
    
    lazy var bottomLabelStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(bottomNameLabel)
        sv.addArrangedSubview(bottomLabel)
        sv.spacing = 10
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .leading
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor.darkPurpleColor
        transaction(from: "0000", to: "\(firstAccount)", amount: 50, type: "genesis")
        transaction(from: "\(firstAccount)", to: "\(secondAccount)", amount: 20, type: "normal")
        chainState()
        self.invalidAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    // Transaction Function
    
    func transaction(from: String, to: String, amount: Int, type: String) {
        if accounts[from] == nil {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else if accounts[from]!-amount < 0 {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else {
            accounts.updateValue(accounts[from]!-amount, forKey: from)
        }
        
        // Checks 2 acounts
        if accounts[to] == nil {
            accounts.updateValue(amount, forKey: to)
        } else {
            accounts.updateValue(accounts[from]!-amount, forKey: to)
        }
        
        //
        if type == "genesis" {
            bitcoinChain.createInitialBlock(data: "From: \(from); To: \(to); Amount: \(amount) BTC")
            
        } else if type == "normal" {
            bitcoinChain.createBlock(data: "From: \(from); To: \(to); Amount: \(amount) BTC")
        }
    }
    
    func chainState() {
        for i in 0...bitcoinChain.chain.count-1 {
            print("\tBlock: \(bitcoinChain.chain[i].index!)\n\tHash: \(bitcoinChain.chain[i].hash!)\n\tPreviousHash: \(bitcoinChain.chain[i].previousHash!)\n\tData: \(bitcoinChain.chain[i].data!)")
        }
        bottomLabel.text = "Balance: \(accounts[String(describing: firstAccount)]!) BTC"
        topLabel.text = "Balance: \(accounts[String(describing: secondAccount)]!) BTC"
        print(accounts)
        print(chainValidity())
    }
    // checks if previous block matches current block
    func chainValidity() -> String {
        var isChainValid = true
        for i in 1...bitcoinChain.chain.count-1 {
            if bitcoinChain.chain[i].previousHash != bitcoinChain.chain[i-1].hash {
                isChainValid = false
            }
        }
        return "Chain is valid: \(isChainValid)\n"
    }
    
    @objc func greenMineTapped(sender:UIButton){
        transaction(from: "0000", to: "\(secondAccount)", amount: 100, type: "normal")
        print("New Block minded by \(secondAccount)")
        chainState()
    }
    
    @objc func greenSendTapped(sender:UIButton){
        if topAmountTF.text == "" {
            present(invalidAlert,animated: true, completion: nil)
        } else {
            transaction(from: "\(secondAccount)", to: "\(firstAccount)", amount: Int(topAmountTF.text!)!, type: "normal")
            print("\(topAmountTF.text!) BTC sent from \(secondAccount) to  \(firstAccount)")
            chainState()
            topAmountTF.text = ""
        }
    }
    
    @objc func redMineTapped(sender:UIButton){
        transaction(from: "0000", to: "\(firstAccount)", amount: 100, type: "normal")
        print("New Block minded by \(firstAccount)")
        chainState()
    }
    
    @objc func redSendTapped(sender:UIButton){
        if bottomAmountTF.text == "" {
            present(invalidAlert,animated: true, completion: nil)
        } else {
            transaction(from: "\(firstAccount)", to: "\(secondAccount)", amount: Int(bottomAmountTF.text!)!, type: "normal")
            print("\(bottomAmountTF.text!) BTC sent from \(firstAccount) to  \(secondAccount)")
            chainState()
            bottomAmountTF.text = ""
        }
    }
    
    
    func setupUI() {
        view.addSubview(topLabelStack)
        view.addSubview(bottomLabelStack)
        view.addSubview(topAmountTF)
        view.addSubview(bottomAmountTF)
        view.addSubview(topBtnStack)
        view.addSubview(bottomBtnStack)
        
        NSLayoutConstraint.activate([
            topLabelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            topAmountTF.topAnchor.constraint(equalTo: topLabelStack.bottomAnchor, constant: 10),
            topAmountTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            topAmountTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        
            topBtnStack.topAnchor.constraint(equalTo: topAmountTF.bottomAnchor, constant: 10),
            topBtnStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            topBtnStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            
            bottomLabelStack.bottomAnchor.constraint(equalTo: bottomAmountTF.topAnchor, constant: -20),
            bottomLabelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            bottomAmountTF.bottomAnchor.constraint(equalTo: bottomBtnStack.topAnchor, constant: -20),
            bottomAmountTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomAmountTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomAmountTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomBtnStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomBtnStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomBtnStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
        ])
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

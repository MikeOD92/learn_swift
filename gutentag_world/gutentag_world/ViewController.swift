//
//  ViewController.swift
//  gutentag_world
//
//  Created by Michael O'Dell on 10/7/22.
//

import UIKit

class ViewController: UIViewController {

    let greetings: [String] = ["Hello World", "Gutentag Welt", "Bonjour le monde", "Hola Mundo", "ハローワールド", "世界您好", "Hej världen", "سلام به دنیا", "مرحبا بالعالم", "Բարև աշխարհ", "Zdravo svijete", "Cześć ludzie", "Chào thế giới", "Bix anikech noj kaab"]
    
    private let text: UITextView = {
        let text = UITextView()
        return text
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("change greeting", for:.normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(text)
        text.frame = CGRect(x: 0, y: 0, width:300, height:50)
        text.center = view.center
        text.text = greetings[0]
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)
    }
    @objc func didTapButton(){
        text.text = greetings.randomElement()
    }
    
}


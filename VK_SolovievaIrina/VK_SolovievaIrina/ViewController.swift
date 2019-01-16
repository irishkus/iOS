//
//  ViewController.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 16.12.2018.
//  Copyright © 2018 Ирина. All rights reserved.
//

import UIKit

    class ButtonWithShadow: UIButton {

        override func draw(_ rect: CGRect) {
            updateLayerProperties()
        }

        func updateLayerProperties() {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 4.0
            self.layer.masksToBounds = false
        }

    }


class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
 
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!

    @IBAction func loginButton(_ sender: ButtonWithShadow) {
        // Получаем текст логина
        let login = loginInput?.text!
        // Получаем текст-пароль
        let password = passwordInput?.text!
        // Проверяем, верны ли они
        if login == " " && password == " " {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }

    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height+60, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе -- когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3218865068, green: 0.5109791314, blue: 0.7149964697, alpha: 1)
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        loginInput.attributedPlaceholder = NSAttributedString(string: "E-mail или телефон",
                                                               attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7408241666, green: 0.8520424613, blue: 0.9033153553, alpha: 1)])
        passwordInput.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                              attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7408241666, green: 0.8520424613, blue: 0.9033153553, alpha: 1)])

        }

    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }

    }





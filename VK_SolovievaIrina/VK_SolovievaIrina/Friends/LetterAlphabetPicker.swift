//
//  LetterAlphabetPicker.swift
//  VK_SolovievaIrina
//
//  Created by Ирина on 09.01.2019.
//  Copyright © 2019 Ирина. All rights reserved.
//

import UIKit

class LetterAlphabetPicker: UIControl {
    //enum characters
    var characters:[Character] = ["И", "П", "С", "У"]
    var selectedCharacter: Character? = nil {
        didSet {
            self.updateSelectedCharacter()
            self.sendActions(for: .valueChanged)
        }
    }
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!

    private func setupView() {
        for char in characters {
            let button = UIButton(type: .system)
            button.setTitle(String(char), for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectChar(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func updateSelectedCharacter() {
        for (index, button) in self.buttons.enumerated() {
            button.isSelected = characters[index] == self.selectedCharacter
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    @objc private func selectChar(_ sender: UIButton) {
        guard let index = self.buttons.index(of: sender) else { return }
        self.selectedCharacter = characters[index]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
}

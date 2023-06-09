//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Василий Васильевич on 22.02.2023.
//

import UIKit
import SnapKit
import StorageService

final class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private let avatarImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "cat"))
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "White Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Listening to music"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Listening to music"
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.cornerRadius = 12
        text.layer.backgroundColor = UIColor.white.cgColor
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 0))
        text.leftView = paddingView
        text.leftViewMode = .always
        return text
    }()
    
    private var statusText: String = ""
    
    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.titleLabel?.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        backgroundColor = .white
        setupConstraints()
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(-14)
            make.right.equalToSuperview().offset(-90)
            make.bottom.equalTo(statusLabel.snp.top).offset(-16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(16)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(statusTextField.snp.top).offset(-16)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-24)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
        }
        
        setStatusButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(78)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(sender: UIButton) {
        statusLabel.text = statusTextField.text
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        // Ничего не делать здесь
    
    }
}

//
//  CustomTableViewCell.swift
//  Assessment_1
//
//  Created by Ephrim Daniel on 22/11/21.
//

import UIKit

protocol textActionDelegate: AnyObject {
	func textAction(row: Int, answer: selectedAnswer)
}

class CustomFieldCell: UITableViewCell, UITextFieldDelegate, cellConfiguration {

    //MARK: VARIABLES
    var index: Int = 0
    static let identifier = "fieldViewCell"
    weak var textDelegate: textActionDelegate? = nil
    
    //MARK: VIEWS
    let stackView  = UIStackView()
    
    lazy var questionLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .left
        myLabel.numberOfLines = 0
		myLabel.textColor =  .label
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    lazy var textField: UITextField = {
        let myTextField = UITextField()
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        myTextField.layer.cornerRadius = 4.0
        myTextField.layer.borderWidth = 0.01
		myTextField.tintColor = .label
        myTextField.delegate = self
		myTextField.layer.backgroundColor = UIColor.systemGroupedBackground.cgColor
        myTextField.addTarget(self, action: #selector(textAction), for: .editingChanged)
        return myTextField
    }()
    
    //MARK: STACK VIEW CONFIGURATION
    func configureStackview() {
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.spacing   = 0

        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(textField)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8 ),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            textField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Stack View
        configureStackview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    //MARK: TEXT FIELD ACTION
    @objc func textAction() {
        let row = index
        guard let string = textField.text else { return }
        let trimmedString = string.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textDelegate?.textAction(row: row, answer: .FieldAnswer(ans: trimmedString))
    }
}

extension CustomFieldCell {
    //TextField pattern validation
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
    
    //MARK: DELEGATION
    func configureCell(data: [Answers]?, delegate: AnyObject, indexPath: Int) {
		if let data = data {
			questionLabel.text = data[indexPath].question
			textDelegate = delegate as? textActionDelegate
		}
    }
}

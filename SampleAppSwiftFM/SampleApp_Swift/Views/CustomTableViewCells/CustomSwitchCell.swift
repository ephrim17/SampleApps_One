//
//  CustomTableViewSwitchCell.swift
//  Assessment_1
//
//  Created by Ephrim Daniel on 23/11/21.
//

import UIKit

protocol switchActionDelegate: AnyObject {
	func switchAction(row: Int, answer: selectedAnswer)
}

class CustomSwitchCell: UITableViewCell, cellConfiguration {

    //MARK: VARIBALES
    var index: Int = 0
    static let identifier : String = "switchCell"
    weak var switchDelegate : switchActionDelegate? = nil
    
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
    
    lazy var segment: UISegmentedControl = {
        let items = ["Yes", "No"]
        let mySegment = UISegmentedControl(items: items)
        mySegment.selectedSegmentIndex = UISegmentedControl.noSegment
        mySegment.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        mySegment.translatesAutoresizingMaskIntoConstraints = false
        return mySegment
    }()
    
    //MARK: STACK VIEW CONFIGURATION
    func configureStackview() {
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .leading
        stackView.distribution  = UIStackView.Distribution.fillProportionally
        stackView.spacing   = 0
        
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(segment)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8 ),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            segment.heightAnchor.constraint(equalToConstant: 31),
            segment.widthAnchor.constraint(equalToConstant: 100)
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
    
    
    //MARK: SEGMENT ACTION
    @objc func segmentAction(_ sender: UISegmentedControl) {
        let row = index
        print("segmentAction \(row)")
        if sender.selectedSegmentIndex == 0 {
            switchDelegate?.switchAction(row: row, answer: .FieldAnswer(ans: "Yes"))
        }
        else {
            switchDelegate?.switchAction(row: row, answer: .FieldAnswer(ans: "No"))
        }
    }
}

extension CustomSwitchCell {
    //MARK: DELEGATION
    func configureCell(data: [Answers]?, delegate: AnyObject, indexPath: Int) {
		if let data = data {
			questionLabel.text = data[indexPath].question
			switchDelegate = delegate as? switchActionDelegate
		}
    }
}

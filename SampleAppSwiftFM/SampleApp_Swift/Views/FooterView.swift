//
//  FooterView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 12/05/25.
//

import UIKit

class FooterView: UIView {
    
    lazy var footerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        self.addSubview(footerLabel)
        NSLayoutConstraint.activate([
            footerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            footerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            footerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        setTextValue()
    }
    
    func setTextValue() {
        let footerModel = JsonProvider.shared.getData(type: FooterModel.self, file: "footer")
        let footerText = footerModel[0].footnotes?[0] ?? "EMPTY TEXTS"
        footerLabel.attributedText = attributeStringForText(footerText)
    }
    
    func attributeStringForText(_ text: String) -> NSAttributedString {
        
        let defaultAlignment: NSTextAlignment = .left.semanticContentAlignment
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byTruncatingTail
        paragraph.alignment = defaultAlignment
        paragraph.lineSpacing = 2
        
        let h3Paragraph = NSMutableParagraphStyle()
        h3Paragraph.alignment = .center
        h3Paragraph.paragraphSpacingBefore = 18
        paragraph.alignment = defaultAlignment
        h3Paragraph.lineSpacing = 2
        
        let attributes = NSMutableDictionary()
        attributes["strong"] = [
            "font": UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        ]
        attributes["h1"] = [
            "font": UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .subheadline).pointSize, weight: .semibold)
        ]
        attributes[""] = [
            "font": UIFont.preferredFont(forTextStyle: .footnote),
            "paragraphStyle": paragraph
        ]
        attributes["h2"] = [
            "font": UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .subheadline).pointSize),
            "foregroundColor": UIColor.label,
            "paragraphStyle": paragraph
        ]
        attributes["h3"] = [
            "font": UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize),
            "foregroundColor": UIColor.label,
            "paragraphStyle": h3Paragraph
        ]
        attributes["a"] = [
            "foregroundColor": UIColor.systemBlue
        ]
        attributes["sup"] = [
            "superscript": 1,
            "baselineOffset": 6,
            "font": UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes as? [NSAttributedString.Key : Any])
        return attributedString
    }
}


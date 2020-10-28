//
//  LabelCell.swift
//  Multiple-Sections
//
//  Created by Tsering Lama on 10/27/20.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    public lazy var textlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    //coming from programmatic
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    // coming from storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // helper initializer method
    private func commonInit() {
        textLabelConstraints()
    }
    
    private func textLabelConstraints() {
        addSubview(textlabel)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textlabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textlabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}




//
//  AccountSummaryCell.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 12.04.2022.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    let typeLabel = UILabel()
    let nameLabel = UILabel()
    let underlineView = UIView()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevroneImageView = UIImageView()

    static let reuseID = "AccountSummaryCell"
    static let rowHeight : CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell{
    private func setup(){
        setupTypeLabel()
        
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .blue
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account Name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Balance Name"
        balanceLabel.textAlignment = .right
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
//        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmountLabel.text = "1 $"
        balanceAmountLabel.textAlignment = .right
        
        contentView.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        chevroneImageView.translatesAutoresizingMaskIntoConstraints = false
        chevroneImageView.image = UIImage(systemName: "chevron.forward")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        addSubview(chevroneImageView)


        
    }
    
    private func layout(){
        layoutTypeLabel()
        
        // UnderLine View
        NSLayoutConstraint.activate([
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1)
        ])
        
        //Name label
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2)
        ])
        
        // balance stack view
        NSLayoutConstraint.activate([
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4)
            
        ])
        
        // image view
        NSLayoutConstraint.activate([
            chevroneImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
//            chevroneImageView.widthAnchor.constraint(equalToConstant: 32),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevroneImageView.trailingAnchor, multiplier: 1)
        ])
    }
    
    
    
    
    
    private func setupTypeLabel(){
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Bank type"
        contentView.addSubview(typeLabel)
    }
    
    private func layoutTypeLabel(){
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2)
        ])
    }
}


//class UnderLine: UIView{
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        style()
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override var intrinsicContentSize: CGSize{
//        return CGSize(width: 200, height: 200)
//    }
//}
//
//extension CustomView {
//    func style(){
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    func layout(){
//
//    }
//}

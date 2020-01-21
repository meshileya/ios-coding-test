//
//  HomeCell.swift
//  ios-coding-test
//
//  Created by Mac on 21/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class HomeCell : UICollectionViewCell {
    
    
    var item: GitMainResponse? {
        didSet {
            if let model = item {
                personNameLabel.text = model.commit.author.name
                commitHeaderLabel.text = model.commit.author.email
                commitMessageLabel.text = model.commit.message
            }
        }
    }
    
    let personNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    let commitHeaderLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.sizeToFit()
        return label
    }()
    
    let commitMessageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.sizeToFit()
        return label
    }()
    
    lazy var bottomLineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var customView : UIView = {
        let view = UIView()
        view.addSubview(personNameLabel)
        view.addSubview(commitHeaderLabel)
        view.addSubview(commitMessageLabel)
        view.addSubview(bottomLineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0
        view.backgroundColor = .white
        
        view.addConstraint(NSLayoutConstraint(item: personNameLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: personNameLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 5))
        
        view.addConstraint(NSLayoutConstraint(item: commitHeaderLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: commitHeaderLabel, attribute: .top, relatedBy: .equal, toItem: personNameLabel, attribute: .bottom, multiplier: 1, constant: 5))
        
        view.addConstraint(NSLayoutConstraint(item: commitMessageLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: commitMessageLabel, attribute: .top, relatedBy: .equal, toItem: commitHeaderLabel, attribute: .bottom, multiplier: 1, constant: 5))
        
        view.addConstraint(NSLayoutConstraint(item: bottomLineView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bottomLineView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bottomLineView, attribute: .top, relatedBy: .equal, toItem: commitMessageLabel, attribute: .bottom, multiplier: 1, constant: 5))
    
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeView (){
        addSubview(customView)
        addConstraint(NSLayoutConstraint(item: customView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: customView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: customView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: customView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -0))
    }
    
}

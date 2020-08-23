//
//  GitHubUserTableViewCell.swift
//  GitHub Users
//
//  Created by Ramesh B on 23/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import UIKit

class GitHubUserTableViewCell: UITableViewCell {
    /// Cell identifier to fetch the cell from the Nib
    static let identifier = String(describing: GitHubUserTableViewCell.self)
    
    // MARK: Outlets
    @IBOutlet weak var cellShadowView: UIView!
    @IBOutlet weak var loginName: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var gitUrlLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var adminStatusLabel: UILabel!
    
    // MARK: Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellShadowView.frame = cellShadowView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            self.cellShadowView.backgroundColor = .white
            self.cellShadowView.layer.masksToBounds = false
            self.cellShadowView.layer.cornerRadius = 8.0
            self.cellShadowView.layer.shadowRadius = 5
            self.cellShadowView.layer.shadowOffset = .zero
            self.cellShadowView.layer.shadowOpacity = 0.3
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
            profileImageView.layer.borderColor = UIColor.systemGreen.cgColor
            profileImageView.layer.borderWidth = 1
    }

    /// Reseting the label and image in order to reuse before loading new data
    override func prepareForReuse() {
        super.prepareForReuse()
        loginName.text = ""
        gitUrlLabel.text = ""
        userTypeLabel.text = ""
        adminStatusLabel.text = ""
        profileImageView.image = nil
    }
    
    // MARK: Internal methods

    /// Configures the cell with PickUp modal
    func congifureCell(userModel: GitHubUser) {
        loginName.text = userModel.loginUserName
        gitUrlLabel.text = userModel.gitHubHtmlUrl
        userTypeLabel.text = userModel.accountType
        if let status = userModel.adminStatus {
            adminStatusLabel.text = status == true ? "True" : "False"
        }
    }

}

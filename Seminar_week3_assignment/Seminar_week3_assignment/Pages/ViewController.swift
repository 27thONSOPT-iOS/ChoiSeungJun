//
//  ViewController.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var rootView: UIView!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    @IBOutlet weak var profileWriteButton: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    var profiles: [Profile] = []
    var originFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileData()
        setViewAttr()
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
    }
    
    func setProfileData() {
        profiles.append(contentsOf: [
                        Profile(name: "이주혁", description: "#hereis#아요#술쟁이", imageName: "juhyeok"),
                        Profile(name: "주혁2", description: "#hereis#아요#술쟁이", imageName: "juhyeok"),
                        Profile(name: "박세은", description: "#hereis#아요#운팀장", imageName: "saeeun"),
                        Profile(name: "봑세은", description: "#hereis#아요#운팀장", imageName: "saeeun"),
                        Profile(name: "이주혁", description: "#hereis#아요#술쟁이", imageName: "juhyeok"),
                        Profile(name: "박세은", description: "#hereis#아요#운팀장", imageName: "saeeun"),
                        Profile(name: "이주혁", description: "#hereis#아요#술쟁이", imageName: "juhyeok"),
                        Profile(name: "박세은", description: "#hereis#아요#운팀장", imageName: "saeeun"),
                        Profile(name: "이주혁", description: "#hereis#아요#술쟁이", imageName: "juhyeok"),
                        Profile(name: "박세은", description: "#hereis#아요#운팀장", imageName: "saeeun")
                        ])
    }

    func setViewAttr() {
        profileWriteButton.layer.cornerRadius = 5
        originFrame = topView.frame
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(profile: profiles[indexPath.row])
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 27 - 48) / 2, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 41, left: 24, bottom: 0, right: 24)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5, animations: {
            self.topViewHeightConstraint.constant = 88
            self.rootView.layoutIfNeeded()
        })
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (decelerate) {
            UIView.animate(withDuration: 0.5, animations: {
                self.topViewHeightConstraint.constant = 0
                self.rootView.layoutIfNeeded()
            })
        }
    }
}

//
//  CausesViewController.swift
//  Change for Change
//
//  Created by Tania Ortiz-Rosales on 7/28/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class CausesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let dataArray = ["Food","Housing", "Health", "Youth", "Employment", "Education", "Arts", "Community", "Animals"]
    var imageArray:[UIImage] = []
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CausesCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "CausesCollectionViewCell")
        self.setUpGridView()
    }
    
    func setUpGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setUpGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    var logoImage: [UIImage] = [UIImage(named: "food.png")!, UIImage(named: "Housing.png")!, UIImage(named: "Health.png")!, UIImage(named: "Youth.png")!,UIImage(named: "Employment.png")!, UIImage(named: "Education.png")!, UIImage(named: "ArtsCulture.png")!, UIImage(named: "Community.png")!, UIImage(named: "Animals.png")!]
}

extension CausesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CausesCollectionViewCell", for: indexPath) as! CausesCollectionViewCell
        cell.setData(text: self.dataArray[indexPath.row])
        cell.setPic(image: self.logoImage[indexPath.row])
        return cell
    }
}


extension CausesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2 )
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize ) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}

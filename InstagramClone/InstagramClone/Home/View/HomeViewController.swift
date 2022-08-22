//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by OMNIADMIN on 17/08/22.
//

import UIKit

class HomeViewController: BaseClassViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setUpForCollectionView()
        self.setUpForTableView()
        setUpTabBar()
            
        viewModel.getHomeViewControllerRelatedData { [weak self] in
            
            self?.collectionView.reloadData()
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setUpTabBar() {
        
        setTabBarImage(title: "Home", imageName: "house")
    }
}

//MARK: TableView delegates and datasources
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpForTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.userPostList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        let item = viewModel.userPostList[indexPath.row]
        cell.setUp(name: item.name,
                   imageName: item.imageName,
                   count: item.likesCount,
                   description: item.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 600
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let userScrolledHeight = scrollView.contentOffset.y
        let storyCellsHeight = collectionView.frame.height + 8
            
        let swipingdown = userScrolledHeight <= 0
        let shouldCollapse = userScrolledHeight > storyCellsHeight
            
        UIView.animate(withDuration: 0.3) {
                
            self.collectionView.alpha = swipingdown ? 1.0 : 0.0
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
                
            self.collectionViewTopConstraint?.constant = shouldCollapse ? -storyCellsHeight : 0
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: CollectionView delegates and datasources

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setUpForCollectionView() {
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        
        cell.setUp(name: viewModel.userPostList[indexPath.row].name,
                   imageName: viewModel.userPostList[indexPath.row].imageName)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.userPostList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
}

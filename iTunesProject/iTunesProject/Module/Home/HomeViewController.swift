//
//  HomeViewController.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import UIKit
import AVFoundation

protocol HomeViewControllerProtocol: AnyObject {
    func setupTableView()
    func reloadData()
    func showError(_ message: String)
    func showLoadingView()
    func hideLoadingView()
}

final class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol!
    var cellPresenter: TrackCellPresenter!
    
    private var searchTimer:Timer?
    private var searchDelay: TimeInterval = 0.7
    private var player: AVPlayer?
    private var currentPlayingIndexPath: IndexPath?
    private var currentPlayingCell: TrackCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        presenter.viewDidLoad()
        setAccessibilityIdentifiers()
        keyboardHidden()
        
    }
    private func keyboardHidden() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension HomeViewController: HomeViewControllerProtocol {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: TrackCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.tableView.reloadData()
        }
    }
    
    func showError(_ message: String) {
        showAlertForInternet("Error", message)
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TrackCell.self, for: indexPath)
        if let track = presenter.track(indexPath.row) {
            cell.cellPresenter = TrackCellPresenter(view: cell, track: track, imageFetcher: ImageFetcher())
            cell.selectionStyle = .none
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(index: indexPath.row)
        
        if let cell = tableView.cellForRow(at: indexPath) as? TrackCell {
            
            if cell.cellPresenter?.isPlaying == true {
                cell.stopPlayback()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dismissKeyboard()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: searchDelay, repeats: false, block: { [weak self] _ in
            self?.performSearch(with: searchText)
        })
    }
    
    private func performSearch(with keyword: String) {
        guard !keyword.isEmpty else {
            presenter.clearSearchResult()
            return
        }
        presenter.searchTrack(with: keyword)
    }
}

extension HomeViewController {
    func setAccessibilityIdentifiers() {
        searchBar.accessibilityIdentifier = "searchBar"
        tableView.accessibilityIdentifier = "trackTableView"
    }
}


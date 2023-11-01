//
//  BoardCaseController.swift
//  OpenCastCustom
//
//  Created by MAC on 01/11/2023.
//

import UIKit



class BoardCaseController: UITableViewController {
  let scanner = CastDeviceScanner()
  
  var clients = [CastClient]() {
    didSet {
      if clients.count == 0 {
        tableView.reloadData()
      } else {
        tableView.insertRows(at: [IndexPath(row: clients.count-1, section: 0)], with: .none)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      view.backgroundColor = .red
    scanner.delegate = self
    scanner.startScanning()
    
    let refresh = UIRefreshControl()
    refresh.addTarget(self,
                      action: #selector(handleRefresh),
                      for: .valueChanged)
    
    tableView.refreshControl = refresh
      
      NotificationCenter.default.addObserver(forName: CastDeviceScanner.deviceListDidChange, object: scanner, queue: nil) { [unowned self] _ in
          
          
          print("DEBUG: NotificationCenter")
      }

  }
  
  @objc func handleRefresh() {
    tableView.refreshControl?.endRefreshing()
    clients.removeAll()
    scanner.reset()
    scanner.startScanning()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let cell = sender as? UITableViewCell,
      let index = tableView.indexPath(for: cell)?.row,
      let detailsViewController = segue.destination as? DetailsViewController else { return }
    
    let client = clients[index]
    detailsViewController.client = client
    detailsViewController.navigationItem.title = client.device.name
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clients.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell") as? DeviceCell else { abort() }
    
    cell.nameLabel.text = clients[indexPath.row].device.name
    
    return cell
  }
}

extension BoardCaseController: CastDeviceScannerDelegate {
  func deviceDidComeOnline(_ device: CastDevice) {
      print("DEBUG: deviceDidComeOnline")
    clients.append(CastClient(device: device))
  }
  
  func deviceDidChange(_ device: CastDevice) {
      print("DEBUG: deviceDidChange")
  }
  
  func deviceDidGoOffline(_ device: CastDevice) {
      print("DEBUG: deviceDidGoOffline")
  }
}


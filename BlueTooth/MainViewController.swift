//
//  MainViewController.swift
//  BlueTooth
//
//  Created by imac-2437 on 2023/8/22.
//

import UIKit
import CoreBluetooth

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelValue: UILabel!
    var allArray: [CBPeripheral]? = []
    var blueToothNameAraay: [String]! = []
    var stampValue: UInt8 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("fgyuuhuhu")
        tableView.backgroundColor = .black
        BluetoothServices.shared.delegate = self
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "addTableViewCell", bundle: nil), forCellReuseIdentifier: addTableViewCell.identifier)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        blueToothNameAraay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: addTableViewCell.identifier, for: indexPath) as! addTableViewCell
//        for i in blueToothNameAraay{
        cell.blueToothName.text = blueToothNameAraay[indexPath.row]
        
        return cell
    }
    
    
}
extension MainViewController: BluetoothServicesDelegate {
    func getBLEPeripherals(peripherals: [CBPeripheral]) {
        allArray = peripherals
//        self.blueToothNameAraay = peripherals
        
        for i in peripherals{
            if blueToothNameAraay.contains(i.name ?? ""){
                continue
            } else {
                blueToothNameAraay.append(i.name ?? "")
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
//        print(peripherals)
    }
    
    func getBlEPeripheralValue(value: UInt8) {
        self.stampValue = value
        DispatchQueue.main.async {
            self.labelValue.text = String(self.stampValue)
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BluetoothServices.shared.connectPeripheral(peripheral: allArray![indexPath.row])
    }
    
}

//
//  SettingsController.swift
//  WeatherWidget_API
//
//  Created by Artem on 26.02.2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit

class SettingsView: UITableViewController {

    let cellIdentifier = "settingsCell"
    private var controller: SettingsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        controller = SettingsController()
        //controller.weatherView = self
        //controller.initiate()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingsViewCell

        if indexPath.row == 0 {
            let switchView = UISwitch()
            switchView.isOn = false
            cell.accessoryView = switchView
            cell.textLabel?.text = "Обирати позицію"
        }
        if indexPath.row == 1 {
            cell.textLabel?.text = "Обрати позицію для аналізу погоди"
        }

        return cell
    }

}

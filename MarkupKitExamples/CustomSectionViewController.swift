//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import MarkupKit

class CustomSectionViewController: UITableViewController {
    static let CellIdentifier = "cell"

    override func loadView() {
        view = LMViewBuilder.viewWithName("CustomSectionView", owner: self, root: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Custom Section View"

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CustomSectionViewController.CellIdentifier)
        
        tableView.dataSource = self
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let n: Int
        if (section == 1) {
            n = 3
        } else {
            n = tableView.numberOfRowsInSection(section)
        }

        return n
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if (indexPath.section == 1) {
            cell = tableView.dequeueReusableCellWithIdentifier(CustomSectionViewController.CellIdentifier)!
            
            cell.textLabel!.text = String(indexPath.row + 1)
        } else {
            cell = tableView.cellForRowAtIndexPath(indexPath)!
        }

        return cell
    }
}
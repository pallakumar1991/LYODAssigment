//
//  ViewController.swift
//  LBGiOSTest
//
//  Created by apple on 13/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = QuestionViewModel()
    var quesitions:DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.apiToGetQuestionData { [weak self] in
            self?.quesitions = self?.viewModel.questionData

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
  /* flatMap
    let numbers = [ [1,2,3,4], [5,6,7,8], [9,10,11,12]]
    let flattenArrayOfNumbers = numbers.flatMap { $0 }
    print(flattenArrayOfNumbers)
    Note: Arranging the array of arrays into single array in flat map :  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  */

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quesitions?.data?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = quesitions?.data?.questions?[indexPath.row].question
        return cell
    }
}

import UIKit

class QuestionBankController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Access the shared QuestionManager for the questions
    var questions: [Question] {
        return QuestionManager.shared.questions
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Register the default cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuestionCell")
    }

    // TableView DataSource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    // TableView DataSource Method - Set up the cells with question text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        
        // Set the cell text as the question text
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.questionText
        
        return cell
    }
    
    // UITableView Delegate Method for row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // The selected question
        let selectedQuestion = questions[indexPath.row]
        
        // Perform segue to the UpdateQuestionsController
        performSegue(withIdentifier: "showUpdateScreen", sender: selectedQuestion)
    }

    // Prepare the data for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUpdateScreen" {
            if let updateVC = segue.destination as? UpdateQuestionsController {
                // Pass the selected question to the UpdateQuestionsController
                if let questionToEdit = sender as? Question {
                    updateVC.question = questionToEdit
                }
            }
        }
    }
}


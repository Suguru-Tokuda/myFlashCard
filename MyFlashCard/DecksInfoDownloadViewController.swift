import UIKit

class DecksInfoDownloadViewController: UITableViewController {
    
    var decks: [Deck]!
    var backButtonString : String!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // will send a deckID
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        decks = appDelegate.decks
        return decks.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        decks = appDelegate.decks

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
        let deck = decks[indexPath.row]
        cell.textLabel?.text = deck.deckName
        return cell
    }


}
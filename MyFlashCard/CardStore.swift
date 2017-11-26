import UIKit
import CoreData

enum CardsResult {
    case success([Card])
    case failure(Error)
}

public class CardStore {
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyFlashCard")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        })
        return container
    }()
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processCardRequest(data: Data?, error: Error?) -> CardsResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return MyFlashCardAPI.cards(fromJSON: jsonData, into: persistentContainer.viewContext)
    }
    
    // MARK: - REST calls
    // MARK: - Practice get all cards
    func fetchAllCards(completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .allCards, parameter: "")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            var result = self.processCardRequest(data: data, error: error)
            if case .success = result {
                do {
                    try self.persistentContainer.viewContext.save()
                } catch let error {
                    result = .failure(error)
                }
            }
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    // MARK: - Cards
    func fetchCardsForDeckID(deckid: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .cardsForDeckid, parameter: deckid)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchCardsForDeckname(deckname: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .cardsForDeckname, parameter: deckname)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    // MARK: - Decks
    func fetchDeckForDeckid(deckid: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .deckForID, parameter: deckid)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchDecksForClassid(classid: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .dekcsForClassid, parameter: classid)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchDecksForClassnumber(classnumber: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .decksForClassnumber, parameter: classnumber)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchDecksForClassname(classname: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .decksForClassname, parameter: classname)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchDecksForUsername(username: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .decksForUsername, parameter: username)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    func fetchDecksForKeyword(keyword: String, completion: @escaping (CardsResult) -> Void) {
        let url = MyFlashCardAPI.myFlashCardURL(method: .decksForKeyword, parameter: keyword)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processCardRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    
    
}

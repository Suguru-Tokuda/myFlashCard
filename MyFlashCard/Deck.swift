import Foundation

public class Deck {
    
    private var deckName: String;
    
    // MARK: - initializers
    public init() {
        deckName = ""
    }
    
    public init(deckName: String) {
        self.deckName = deckName
    }
    
    // MARK: - getters & setters
    public func getDeckName() -> String {
        return deckName
    }
    
    public func setDeckName(deckName: String) {
        self.deckName = deckName
    }
}
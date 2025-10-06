//MARK: ChaceStorageManager

protocol ChaceStorageManager {
    
}

class ChaceStorageManagerImpl: ChaceStorageManager {
    private let networkManager: NetworkManager
    init(networkManager:NetworkManager) {
        self.networkManager = networkManager
    }
}


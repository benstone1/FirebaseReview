import Foundation

protocol FirebaseConvertible: Codable {
    func fieldsDict() -> [String: Any]
    init?(fromFirebaseDict dict: [String: Any])
}

extension FirebaseConvertible {
    init?(fromFirebaseDict dict: [String: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: dict)
            let object = try JSONDecoder().decode(Self.self, from: data)
            self = object
        } catch {
            return nil
        }
    }
    func fieldsDict() -> [String: Any] {
        return try! JSONSerialization.jsonObject(with: JSONEncoder().encode(self)) as! [String: Any]
    }
}

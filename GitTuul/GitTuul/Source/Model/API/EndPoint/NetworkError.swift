import Foundation

enum NetworkError: Error {
    case invalidUrl
    case emptyData
    case failToDecode
    case failToOpen
}

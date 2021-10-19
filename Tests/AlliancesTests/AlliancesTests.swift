import XCTest
@testable import Alliances

final class AlliancesTests: XCTestCase {
    
    public struct TestApp: AlliancesApp {
        
        public static let bundleID: String = UUID().uuidString
        public var name: String { Self.bundleID }
        public var remark: String? { "remark" }
        public var tasks: [AlliancesApp.Type] = []
        public var core: AlliancesUICore = .init()
        
        public init() {}

        public func openSettings() {
            progress -= 0.05
        }

        public func run() throws {
            progress += 0.05
        }
    }

    func testExample() throws {

    }
}

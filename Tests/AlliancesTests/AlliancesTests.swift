import XCTest
@testable import Alliances

final class AlliancesTests: XCTestCase {
    
    struct TestApp: AlliancesApp {
        
        var name: String { UUID().uuidString }
        var remark: String? { "remark" }
        var tasks: [AlliancesApp.Type] = []
        var core: AlliancesUICore = .init()
        init() {}

        func openSettings() {
            progress -= 0.05
        }

        func run() throws {
            progress += 0.05
        }
    }

    func testExample() throws {

    }
}

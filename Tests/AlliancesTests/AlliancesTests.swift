import XCTest
@testable import Alliances

final class AlliancesTests: XCTestCase {
    
    class TestApp: AlliancesApp {
        
        static var bundleID: String = UUID().uuidString
        
        var name: String { Self.bundleID }
        
        var remark: String? {
            "remark"
        }
        
        var tasks: [AlliancesApp] = []
        
        var core: AlliancesUICore = .init()
        
        func openSettings() {
            progress -= 0.05
        }
        
        func run() throws {
            progress += 0.05
        }
        
        required init() {}
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(Alliances().text, "Hello, World!")
    }
}

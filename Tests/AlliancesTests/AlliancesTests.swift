import XCTest
import SwiftUI
@testable import Alliances

final class AlliancesTests: XCTestCase {
    
    public struct TestApp: AlliancesApp {
        
        public static let appInfo: AppInfo = .init(id: "test", name: "Test", icon: nil, summary: "summary")
        
        public static let bundleID: String = UUID().uuidString
        public var core: AlliancesUICore = .init()
        public var configuration: AlliancesConfiguration
        
        public var name: String { Self.bundleID }
        public var remark: String? { "remark" }
        public var tasks: [AlliancesApp] = []
        
        public init(_ configuration: AlliancesConfiguration) {
            self.configuration = configuration
        }
        
        public var settingsView: AnyView? {
            .init(VStack {
                Text("1111")
                Text("1111")
                Text("1111")
                Text("1111")
                Text("1111")
            })
        }
        
        public func run() throws {
            progress += 0.05
        }
    }
    
    func testExample() throws {
        
    }
}

import Foundation
import Stem

public class AlliancesConfiguration {
    
    public var folder: FilePath.Folder
    
    public var settings: [String: Any] {
        set {
            (newValue as NSDictionary).write(to: folder.file(name: "settings.plist").url, atomically: true)
        }
        get {
            guard let dict = NSDictionary(contentsOfFile: folder.file(name: "settings.plist").url.path) else {
                return [:]
            }
            return (dict as? [String : Any]) ?? [:]
        }
    }
    
    public init(folder: FilePath.Folder) {
        self.folder = folder
    }
    
    public convenience init(from configuration: AlliancesConfiguration, app: AlliancesApp.Type) {
        self.init(folder: try! configuration.folder.create(folder: app.bundleID))
    }
    
}

public protocol AlliancesApp: AlliancesDelegate {
    
    var configuration: AlliancesConfiguration { get }
    
    static var bundleID: String { get }
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp] { get }
    
    init(_ configuration: AlliancesConfiguration)
}


public extension AlliancesApp {
        
    var remark: String? { nil }
    
}

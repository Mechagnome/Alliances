import Foundation
import Stem

public protocol AlliancesApp: AlliancesDelegate {
    
    static var bundleID: String { get }
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp] { get }
    /// 处理路由
    func deeplink(open url: URL) -> Bool
    
    var folder: FilePath.Folder { get }
    
    init(folder: FilePath.Folder)
}


public extension AlliancesApp {
    
    func folder(task: AlliancesApp.Type) throws -> FilePath.Folder {
       try folder.create(folder: task.bundleID)
    }
    
    var remark: String? { nil }
    
    func deeplink(open url: URL) -> Bool { false }
    
}

import Foundation

public protocol AlliancesApp: AlliancesDelegate {
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp] { get }

}

public extension AlliancesApp {
    
    var remark: String? { nil }
    
}

//
//  File.swift
//  
//
//  Created by linhey on 2021/10/18.
//

import Combine
import Foundation
import SwiftUI

public class AlliancesUICore {
    
    public let reload = PassthroughSubject<Void, Never>()
    
    public let canOpenSettings = CurrentValueSubject<Bool, Never>(true)
    public let canRun = CurrentValueSubject<Bool, Never>(true)
    public let progress = CurrentValueSubject<Double, Never>(0)
    
    public init() {}

}

public protocol AlliancesDelegate {
    
    var core: AlliancesUICore { get }
    
    var canOpenSettings: Bool { get set }
    var canRun: Bool { get set }

    func openSettings() -> AnyView?
    
    func run() throws
    
}

public extension AlliancesDelegate {
    
    func openSettings() -> AnyView? {
        nil
    }
    
    var canOpenSettings: Bool {
        nonmutating set { core.canOpenSettings.send(newValue) }
        get { core.canOpenSettings.value }
    }
    
    var canRun: Bool {
        nonmutating set { core.canRun.send(newValue) }
        get { core.canRun.value }
    }
    
    var progress: Double {
        nonmutating set { core.progress.send(newValue) }
        get { core.progress.value }
    }
    
    func reload() {
        core.reload.send()
    }
    
}

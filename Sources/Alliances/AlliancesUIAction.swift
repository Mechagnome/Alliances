//
//  File.swift
//  
//
//  Created by linhey on 2021/10/18.
//

import Combine

public class AlliancesUICore {
    
    let reload = PassthroughSubject<Void, Never>()
    
}

public protocol AlliancesDelegate {
    
    var core: AlliancesUICore { get }
    
    var canOpenSetting: Bool { get }
    var canRun: Bool { get }

    func openSetting()
    func run()
    
}

public extension AlliancesDelegate {
    
    var canOpenSetting: Bool { true }
    var canRun: Bool { true }
    
    func reload() {
        core.reload.send()
    }
    
}

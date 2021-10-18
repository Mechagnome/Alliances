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
    
    func openSetting()
    
    func run()
}

public extension AlliancesDelegate {
    
    func reload() {
        core.reload.send()
    }
    
}

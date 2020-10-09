//
//  WorkerStruct.swift
//  HiveClient
//
//  Created by Smart Cash on 17.02.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import Foundation
struct WorkersStruct: Decodable {
    let data: [Workers]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
}

struct Workers: Decodable, Identifiable {
    let id, platform: Int
    let name: String
//    let unitsCount: Int
//    let active: Bool
//    let password: String
//    let tagIDS: [Int]
//    let mirrorURL: String
//    let redTemp, redFan, redASR: Int
//    let redLa: Double
//    let redHashrates: RedHashrate?
//    let ipAddresses: String
//    let remoteAddress: RemoteAddress?
//    let vpn, hasAMD, hasNvidia, needsUpgrade: Bool
//    let packagesHash: String
//    let lanConfig: LANConfig?
//    let hasOctofan, hasCoolbox: Bool
//    let versions: Versions?
//    let stats: PurpleStats?
//    let flightSheet: FlightSheet?
//    let overclock: Overclock?
//    let minersSummary: MinersSummary?
//    let minersStats: MinersStats?
//    let hardwareInfo: HardwareInfo?
    let hardwareStats: HardwareStats?
//    let gpuSummary: GPUSummary?
//    let gpuInfo: GPUInfo?
//    let gpuStats: GPUStat?
//    let asicInfo: ASICInfo?
//    let asicStats: ASICStats?
//    let messages: Message?
//    let watchdog: Watchdog?
//    let options: Options?
//    let hardwarePowerDraw, psuEfficiency: Int
//    let autofan: Autofan?
//    let octofan: Octofan?
////    let octofanStats: StatsCoolBox
//    let coolbox: Coolbox?
//    let coolboxInfo: CoolboxInfo?
////    let coolboxStats: StatsCoolBox
//    let commands: Command?
//    let benchmarkID: Int
//
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case platform = "platform"
        case name = "name"
//        case description = "description"
//        case unitsCount = "units_count"
//        case active, password
//        case tagIDS = "tag_ids"
//        case mirrorURL = "mirror_url"
//        case redTemp = "red_temp"
//        case redFan = "red_fan"
//        case redASR = "red_asr"
//        case redLa = "red_la"
//        case redHashrates = "red_hashrates"
//        case ipAddresses = "ip_addresses"
//        case remoteAddress = "remote_address"
//        case vpn = "vpn"
//        case hasAMD = "has_amd"
//        case hasNvidia = "has_nvidia"
//        case needsUpgrade = "needs_upgrade"
//        case packagesHash = "packages_hash"
//        case lanConfig = "lan_config"
//        case hasOctofan = "has_octofan"
//        case hasCoolbox = "has_coolbox"
//        case versions, stats
//        case flightSheet = "flight_sheet"
//        case overclock = "overclock"
//        case minersSummary = "miners_summary"
//        case minersStats = "miners_stats"
//        case hardwareInfo = "hardware_info"
        case hardwareStats = "hardware_stats"
//        case gpuSummary = "gpu_summary"
//        case gpuInfo = "gpu_info"
//        case gpuStats = "gpu_stats"
//        case asicInfo = "asic_info"
//        case asicStats = "asic_stats"
//        case messages = "messages"
//        case watchdog = "watchdog"
//        case options = "options"
//        case hardwarePowerDraw = "hardware_power_draw"
//        case psuEfficiency = "psu_efficiency"
//        case autofan, octofan
////        case octofanStats = "octofan_stats"
//        case coolbox = "coolbox"
//        case coolboxInfo = "coolbox_info"
////        case coolboxStats = "coolbox_stats"
//        case commands
//        case benchmarkID = "benchmark_id"
    }
//
//
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = (try container.decodeIfPresent(Int.self, forKey: .id)) ?? 0
            platform = (try container.decodeIfPresent(Int.self, forKey: .platform)) ?? 0
            name = (try container.decodeIfPresent(String.self, forKey: .name)) ?? ""
//            description = (try container.decodeIfPresent(String.self, forKey: .description)) ?? ""
//            unitsCount = (try container.decodeIfPresent(Int.self, forKey: .unitsCount)) ?? 0
//            active = (try container.decodeIfPresent(Bool.self, forKey: .active)) ?? false
//            password = (try container.decodeIfPresent(String.self, forKey: .password)) ?? ""
//            tagIDS = (try container.decodeIfPresent([Int].self, forKey: .tagIDS)) ?? [0]
//            mirrorURL = (try container.decodeIfPresent(String.self, forKey: .mirrorURL)) ?? ""
//            redTemp = (try container.decodeIfPresent(Int.self, forKey: .redTemp)) ?? 0
//            redFan = (try container.decodeIfPresent(Int.self, forKey: .redFan)) ?? 0
//            redASR = (try container.decodeIfPresent(Int.self, forKey: .redASR)) ?? 0
//            redLa = (try container.decodeIfPresent(Double.self, forKey: .redLa)) ?? 0.0
//            redHashrates = (try container.decodeIfPresent(RedHashrate.self, forKey: .redHashrates)) ?? nil
//            ipAddresses = (try container.decodeIfPresent(String.self, forKey: .ipAddresses)) ?? ""
//            remoteAddress = (try container.decodeIfPresent(RemoteAddress.self, forKey: .remoteAddress)) ?? nil
//            vpn = (try container.decodeIfPresent(Bool.self, forKey: .vpn)) ?? false
//            hasAMD = (try container.decodeIfPresent(Bool.self, forKey: .hasAMD)) ?? false
//            hasNvidia = (try container.decodeIfPresent(Bool.self, forKey: .hasNvidia)) ?? false
//            needsUpgrade = (try container.decodeIfPresent(Bool.self, forKey: .needsUpgrade)) ?? false
//            packagesHash = (try container.decodeIfPresent(String.self, forKey: .packagesHash)) ?? ""
//            lanConfig = (try container.decodeIfPresent(LANConfig.self, forKey: .lanConfig)) ?? nil
//            hasOctofan = (try container.decodeIfPresent(Bool.self, forKey: .hasOctofan)) ?? false
//            hasCoolbox = (try container.decodeIfPresent(Bool.self, forKey: .hasCoolbox)) ?? false
//            versions = (try container.decodeIfPresent(Versions.self, forKey: .versions)) ?? nil
//            stats = (try container.decodeIfPresent(PurpleStats.self, forKey: .stats)) ?? nil
//            flightSheet = (try container.decodeIfPresent(FlightSheet.self, forKey: .flightSheet)) ?? nil
//            overclock = (try container.decodeIfPresent(Overclock.self, forKey: .overclock)) ?? nil
//            minersSummary = (try container.decodeIfPresent(MinersSummary.self, forKey: .minersSummary)) ?? nil
//            minersStats = (try container.decodeIfPresent(MinersStats.self, forKey: .minersStats)) ?? nil
//            hardwareInfo = (try container.decodeIfPresent(HardwareInfo.self, forKey: .hardwareInfo)) ?? nil
            hardwareStats = (try container.decodeIfPresent(HardwareStats.self, forKey: .hardwareStats)) ?? nil
//            gpuSummary = (try container.decodeIfPresent(GPUSummary.self, forKey: .gpuSummary)) ?? nil
//            gpuInfo = (try container.decodeIfPresent(GPUInfo.self, forKey: .gpuInfo)) ?? nil
//            gpuStats = (try container.decodeIfPresent(GPUStat.self, forKey: .gpuStats)) ?? nil
//            asicInfo = (try container.decodeIfPresent(ASICInfo.self, forKey: .asicInfo)) ?? nil
//            asicStats = (try container.decodeIfPresent(ASICStats.self, forKey: .asicStats)) ?? nil
//            messages = (try container.decodeIfPresent(Message.self, forKey: .messages)) ?? nil
//            watchdog = (try container.decodeIfPresent(Watchdog.self, forKey: .watchdog)) ?? nil
//            options = (try container.decodeIfPresent(Options.self, forKey: .options)) ?? nil
//            hardwarePowerDraw = (try container.decodeIfPresent(Int.self, forKey: .hardwarePowerDraw)) ?? 0
//            psuEfficiency = (try container.decodeIfPresent(Int.self, forKey: .psuEfficiency)) ?? 0
//            autofan = (try container.decodeIfPresent(Autofan.self, forKey: .autofan)) ?? nil
//            octofan = (try container.decodeIfPresent(Octofan.self, forKey: .octofan)) ?? nil
//            coolbox = (try container.decodeIfPresent(Coolbox.self, forKey: .coolbox)) ?? nil
//            coolboxInfo = (try container.decodeIfPresent(CoolboxInfo.self, forKey: .coolboxInfo)) ?? nil
//            commands = (try container.decodeIfPresent(Command.self, forKey: .commands)) ?? nil
//            benchmarkID = (try container.decodeIfPresent(Int.self, forKey: .benchmarkID)) ?? 0
    }
}
//
//struct ASICInfo: Decodable {
//    let model, logicVersion, firmware: String
//
//    enum CodingKeys: String, CodingKey {
//        case model = "model"
//        case logicVersion = "logic_version"
//        case firmware = "firmaware"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        model = (try container.decodeIfPresent(String.self, forKey: .model) ?? "")
//        logicVersion = (try container.decodeIfPresent(String.self, forKey: .logicVersion) ?? "")
//        firmware = (try container.decodeIfPresent(String.self, forKey: .firmware) ?? "")
//    }
//}
//
//struct ASICStats: Decodable {
//    let fans: Fan?
//    let fansCount: Int
//    let boards: Board?
//    let asicboost: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case fans = "fans"
//        case fansCount = "fans_count"
//        case boards = "boards"
//        case asicboost = "asicboost"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        fans = (try container.decodeIfPresent(Fan.self, forKey: .fans)) ?? nil
//        fansCount = (try container.decodeIfPresent(Int.self, forKey: .fansCount)) ?? 0
//        boards = (try container.decodeIfPresent(Board.self, forKey: .boards)) ?? nil
//        asicboost = (try container.decodeIfPresent(Bool.self, forKey: .asicboost)) ?? false
//    }
//}
//
//struct Board: Decodable {
//    let chain, acn: Int
//    let freq: Double
//    let status: [Int]
//    let temp, boardTemp, hwErrors: Int
//    let power: Double
//
//    enum CodingKeys: String, CodingKey {
//        case chain      = "chain"
//        case acn        = "acn"
//        case freq       = "freq"
//        case status     = "status"
//        case temp       = "temp"
//        case boardTemp  = "board_temp"
//        case hwErrors   = "hw_errors"
//        case power      = "power"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        chain = (try container.decodeIfPresent(Int.self, forKey: .chain)) ?? 0
//        acn = (try container.decodeIfPresent(Int.self, forKey: .acn)) ?? 0
//        freq = (try container.decodeIfPresent(Double.self, forKey: .freq)) ?? 0.0
//        status = (try container.decodeIfPresent([Int].self, forKey: .status)) ?? [0]
//        temp = (try container.decodeIfPresent(Int.self, forKey: .temp)) ?? 0
//        boardTemp = (try container.decodeIfPresent(Int.self, forKey: .boardTemp)) ?? 0
//        hwErrors = (try container.decodeIfPresent(Int.self, forKey: .hwErrors)) ?? 0
//        power = (try container.decodeIfPresent(Double.self, forKey: .power)) ?? 0.0
//
//    }
//}
//
//struct Fan: Decodable {
//    let index, fan, fanRPM: Int
//
//    enum CodingKeys: String, CodingKey {
//        case index = "index"
//        case fan = "fan"
//        case fanRPM = "fan_rpm"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        index = (try container.decodeIfPresent(Int.self, forKey: .index)) ?? 0
//        fan = (try container.decodeIfPresent(Int.self, forKey: .fan)) ?? 0
//        fanRPM = (try container.decodeIfPresent(Int.self, forKey: .fanRPM)) ?? 0
//    }
//}
//
//struct Autofan: Decodable {
//    let enabled: Bool
//    let targetTemp, minFan, maxFan, criticalTemp: Int
//    let criticalTempAction: String
//    let noAMD, rebootOnErrors: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case enabled            = "enabled"
//        case targetTemp         = "target_temp"
//        case minFan             = "min_fan"
//        case maxFan             = "max_fan"
//        case criticalTemp       = "critical_temp"
//        case criticalTempAction = "critical_temp_action"
//        case noAMD              = "no_amd"
//        case rebootOnErrors     = "reboot_on_errors"
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        enabled = (try container.decodeIfPresent(Bool.self, forKey: .enabled)) ?? false
//        targetTemp = (try container.decodeIfPresent(Int.self, forKey: .targetTemp)) ?? 0
//        minFan = (try container.decodeIfPresent(Int.self, forKey: .minFan)) ?? 0
//        maxFan = (try container.decodeIfPresent(Int.self, forKey: .maxFan)) ?? 0
//        criticalTemp = (try container.decodeIfPresent(Int.self, forKey: .criticalTemp)) ?? 0
//        criticalTempAction = (try container.decodeIfPresent(String.self, forKey: .criticalTempAction)) ?? ""
//        noAMD = (try container.decodeIfPresent(Bool.self, forKey: .noAMD)) ?? false
//        rebootOnErrors = (try container.decodeIfPresent(Bool.self, forKey: .rebootOnErrors)) ?? false
//
//
//    }
//}
//
//struct Command: Decodable {
//    let command: String
//    let id: Int
//    let data: PurpleData?
//
//    enum CodingKeys: String, CodingKey {
//        case command = "command"
//        case id = "id"
//        case data = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        command = (try container.decodeIfPresent(String.self, forKey: .command)) ?? ""
//        id = (try container.decodeIfPresent(Int.self, forKey: .id)) ?? 0
//        data = (try container.decodeIfPresent(PurpleData.self, forKey: .data)) ?? nil
//    }
//}
//
//struct PurpleData: Decodable {
//}
//
//struct Coolbox: Decodable {
//    let fan: Int
//    let auto: Bool
//    let targetTemp: Int
//    let wdEnabled: Bool
//    let wdInterval: Int
//
//    enum CodingKeys: String, CodingKey {
//        case fan = "fan"
//        case auto = "auto"
//        case targetTemp = "target_temp"
//        case wdEnabled = "wd_enabled"
//        case wdInterval = "wd_interval"
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        fan = (try container.decodeIfPresent(Int.self, forKey: .fan)) ?? 0
//        auto = (try container.decodeIfPresent(Bool.self, forKey: .auto)) ?? false
//        targetTemp = (try container.decodeIfPresent(Int.self, forKey: .targetTemp)) ?? 0
//        wdEnabled = (try container.decodeIfPresent(Bool.self, forKey: .wdEnabled)) ?? false
//        wdInterval = (try container.decodeIfPresent(Int.self, forKey: .wdInterval)) ?? 0
//    }
//}
//
//struct CoolboxInfo: Decodable {
//    let version, revision: String
//}
//
////struct StatsCoolBox: Decodable {
////    let casefan, thermosensors: [Int]
////}
//
//struct FlightSheet: Decodable {
//    let id, farmID, userID: Int
//    let name: String
//    let items: [Item]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case farmID = "farm_id"
//        case userID = "user_id"
//        case name, items
//    }
//}
//
//struct Item: Decodable {
//    let coin, pool: String
//    let walID: Int
//    let dcoin, dpool: String
//    let dwalID: Int
//    let miner, minerAlt: String
//
//    enum CodingKeys: String, CodingKey {
//        case coin, pool
//        case walID = "wal_id"
//        case dcoin, dpool
//        case dwalID = "dwal_id"
//        case miner
//        case minerAlt = "miner_alt"
//    }
//}
//
//struct GPUInfo: Decodable {
//    let busID: String
//    let busNumber: Int
//    let brand, model: String
//    let details: Details
//    let powerLimit: PowerLimit
//    let index: Int
//
//    enum CodingKeys: String, CodingKey {
//        case busID = "bus_id"
//        case busNumber = "bus_number"
//        case brand, model, details
//        case powerLimit = "power_limit"
//        case index
//    }
//}
//
//struct Details: Decodable {
//    let mem: String
//    let memGB: Int
//    let memType, memOEM, vbios, subvendor: String
//    let oem: String
//
//    enum CodingKeys: String, CodingKey {
//        case mem
//        case memGB = "mem_gb"
//        case memType = "mem_type"
//        case memOEM = "mem_oem"
//        case vbios, subvendor, oem
//    }
//}
//
//struct PowerLimit: Decodable {
//    let min, def, max: String
//}
//
//struct GPUStat: Decodable {
//    let busNumber, temp, fan, power: Int
//    let coreclk, memclk: Int
//
//    enum CodingKeys: String, CodingKey {
//        case busNumber = "bus_number"
//        case temp, fan, power, coreclk, memclk
//    }
//}
//
//struct GPUSummary: Decodable {
//    let gpus: [Gpus]
//    let maxTemp, maxFan: Int
//
//    enum CodingKeys: String, CodingKey {
//        case gpus
//        case maxTemp = "max_temp"
//        case maxFan = "max_fan"
//    }
//}
//
//struct Gpus: Decodable {
//    let name: String
//    let amount: Int
//}
//
//struct HardwareInfo: Decodable {
//    let motherboard: Motherboard
//    let cpu: CPU
//    let disk: Disk
//    let netInterfaces: [NetInterface]
//
//    enum CodingKeys: String, CodingKey {
//        case motherboard, cpu, disk
//        case netInterfaces = "net_interfaces"
//    }
//}
//
//struct CPU: Decodable {
//    let id, model: String
//    let cores: Int
//    let aes: Bool
//}
//
//struct Disk: Decodable {
//    let model: String
//}
//
//struct Motherboard: Decodable {
//    let manufacturer, model, bios: String
//}
//
//struct NetInterface: Decodable {
//    let iface, mac: String
//}
//
struct HardwareStats: Decodable {
    let df: String
    let cpuavg: [Double]
    let cpuCores: Int
//    let memory: Memory

    enum CodingKeys: String, CodingKey {
        case df, cpuavg
        case cpuCores = "cpu_cores"
//        case memory
    }
}
//
//struct Memory: Decodable {
//    let total, free: Int
//}
//
//struct LANConfig: Decodable {
//    let dhcp: Bool
//    let address, gateway, dns: String
//}
//
//struct Message: Decodable {
//    let id: Int
//    let title, type: String
//    let time, cmdID: Int
//    let command: String
//    let commandResult: PurpleData
//    let hasPayload: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, type, time
//        case cmdID = "cmd_id"
//        case command
//        case commandResult = "command_result"
//        case hasPayload = "has_payload"
//    }
//}
//
//struct MinersStats: Decodable {
//    let hashrates: [MinersStatsHashrate]
//}
//
//struct MinersStatsHashrate: Decodable {
//    let miner, algo, coin: String
//    let hashes: [Int]
//    let dalgo, dcoin: String
//    let dhashes, temps, fans, invalidShares: [Int]
//    let busNumbers: [Int]
//
//    enum CodingKeys: String, CodingKey {
//        case miner, algo, coin, hashes, dalgo, dcoin, dhashes, temps, fans
//        case invalidShares = "invalid_shares"
//        case busNumbers = "bus_numbers"
//    }
//}
//
//struct MinersSummary: Decodable {
//    let hashrates: [MinersSummaryHashrate]
//}
//
//struct MinersSummaryHashrate: Decodable {
//    let miner, ver, algo, coin: String
//    let hash: Int
//    let dalgo, dcoin: String
//    let dhash: Int
//    let shares: Shares
//}
//
//struct Shares: Decodable {
//    let accepted, rejected, invalid: Int
//    let ratio: Double
//}
//
//struct Octofan: Decodable {
//    let fan: Int
//    let auto: Bool
//    let targetTemp, minFan, maxFan: Int
//    let blinkOnErrors, blinkToFind: Bool
//    let fan1MaxRPM, fan2MaxRPM, fan3MaxRPM, fan1Port: Int
//    let fan2Port, fan3Port: Int
//
//    enum CodingKeys: String, CodingKey {
//        case fan, auto
//        case targetTemp = "target_temp"
//        case minFan = "min_fan"
//        case maxFan = "max_fan"
//        case blinkOnErrors = "blink_on_errors"
//        case blinkToFind = "blink_to_find"
//        case fan1MaxRPM = "fan1_max_rpm"
//        case fan2MaxRPM = "fan2_max_rpm"
//        case fan3MaxRPM = "fan3_max_rpm"
//        case fan1Port = "fan1_port"
//        case fan2Port = "fan2_port"
//        case fan3Port = "fan3_port"
//    }
//}
//
//struct Options: Decodable {
//    let disableGUI: Bool
//    let maintenanceMode, pushInterval, minerDelay: Int
//
//    enum CodingKeys: String, CodingKey {
//        case disableGUI = "disable_gui"
//        case maintenanceMode = "maintenance_mode"
//        case pushInterval = "push_interval"
//        case minerDelay = "miner_delay"
//    }
//}
//
//struct Overclock: Decodable {
//    let algo: String
//    let amd: AMD
//    let nvidia: Nvidia
//    let asic: ASIC
//}
//
//struct AMD: Decodable {
//    let coreClock, coreState, coreVddc, memClock: String
//    let memState, fanSpeed: String
//    let aggressive: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case coreClock = "core_clock"
//        case coreState = "core_state"
//        case coreVddc = "core_vddc"
//        case memClock = "mem_clock"
//        case memState = "mem_state"
//        case fanSpeed = "fan_speed"
//        case aggressive
//    }
//}
//
//struct ASIC: Decodable {
//    let additionalProp1: PurpleData
//}
//
//struct Nvidia: Decodable {
//    let coreClock, memClock, fanSpeed, powerLimit: String
//    let logoOff, ohgodapill: Bool
//    let ohgodapillStartTimeout: Int
//    let ohgodapillArgs: String
//    let runningDelay: Int
//
//    enum CodingKeys: String, CodingKey {
//        case coreClock = "core_clock"
//        case memClock = "mem_clock"
//        case fanSpeed = "fan_speed"
//        case powerLimit = "power_limit"
//        case logoOff = "logo_off"
//        case ohgodapill
//        case ohgodapillStartTimeout = "ohgodapill_start_timeout"
//        case ohgodapillArgs = "ohgodapill_args"
//        case runningDelay = "running_delay"
//    }
//}
//
//struct RedHashrate: Decodable {
//    let algo: String
//    let hashrate: Int
//
//    enum CodingKeys: String, CodingKey {
//    case algo = "algo"
//    case hashrates = "hashrates"
//    }
//
//    init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//        algo = (try container.decodeIfPresent(String.self, forKey: .algo)) ?? ""
//        hashrate = (try container.decodeIfPresent(Int.self, forKey: .hashrates)) ?? 0
//    }
//}
//
//struct RemoteAddress: Decodable {
//    let ip, hostname: String
//}
//
//struct PurpleStats: Decodable {
//    let online: Bool
//    let bootTime, statsTime, minerStartTime, gpusOnline: Int
//    let gpusOffline, gpusOverheated, cpusOffline, boardsOnline: Int
//    let boardsOffline, boardsOverheated, powerDraw: Int
//    let overheated, overloaded, invalid, lowASR: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case online
//        case bootTime           = "boot_time"
//        case statsTime          = "stats_time"
//        case minerStartTime     = "miner_start_time"
//        case gpusOnline         = "gpus_online"
//        case gpusOffline        = "gpus_offline"
//        case gpusOverheated     = "gpus_overheated"
//        case cpusOffline        = "cpus_offline"
//        case boardsOnline       = "boards_online"
//        case boardsOffline      = "boards_offline"
//        case boardsOverheated   = "boards_overheated"
//        case powerDraw          = "power_draw"
//        case overheated, overloaded, invalid
//        case lowASR             = "low_asr"
//    }
//
//    init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    online = (try container.decodeIfPresent(Bool.self, forKey: .online)) ?? false
//    bootTime = (try container.decodeIfPresent(Int.self, forKey: .bootTime)) ?? 0
//    statsTime = (try container.decodeIfPresent(Int.self, forKey: .statsTime)) ?? 0
//    minerStartTime = (try container.decodeIfPresent(Int.self, forKey: .minerStartTime)) ?? 0
//    gpusOnline = (try container.decodeIfPresent(Int.self, forKey: .gpusOnline)) ?? 0
//    gpusOffline = (try container.decodeIfPresent(Int.self, forKey: .gpusOffline)) ?? 0
//    gpusOverheated = (try container.decodeIfPresent(Int.self, forKey: .gpusOverheated)) ?? 0
//    cpusOffline = (try container.decodeIfPresent(Int.self, forKey: .cpusOffline)) ?? 0
//    boardsOnline = (try container.decodeIfPresent(Int.self, forKey: .boardsOnline)) ?? 0
//    boardsOffline = (try container.decodeIfPresent(Int.self, forKey: .boardsOffline)) ?? 0
//    boardsOverheated = (try container.decodeIfPresent(Int.self, forKey: .boardsOverheated)) ?? 0
//    powerDraw = (try container.decodeIfPresent(Int.self, forKey: .powerDraw)) ?? 0
//    overheated = (try container.decodeIfPresent(Bool.self, forKey: .overheated)) ?? false
//    overloaded = (try container.decodeIfPresent(Bool.self, forKey: .overloaded)) ?? false
//    invalid = (try container.decodeIfPresent(Bool.self, forKey: .invalid)) ?? false
//    lowASR = (try container.decodeIfPresent(Bool.self, forKey: .lowASR)) ?? false
//    }
//}
//
//struct Versions: Decodable {
//    let hive, systemType, kernel, amdDriver: String
//    let nvidiaDriver: String
//
//    enum CodingKeys: String, CodingKey {
//        case hive
//        case systemType = "system_type"
//        case kernel
//        case amdDriver = "amd_driver"
//        case nvidiaDriver = "nvidia_driver"
//    }
//}
//
//struct Watchdog: Decodable {
//    let enabled: Bool
//    let restartTimeout, rebootTimeout: Int
//    let checkGPU: Bool
//    let maxLa: Int
//    let options: [Option]
//
//    enum CodingKeys: String, CodingKey {
//        case enabled
//        case restartTimeout = "restart_timeout"
//        case rebootTimeout = "reboot_timeout"
//        case checkGPU = "check_gpu"
//        case maxLa = "max_la"
//        case options
//    }
//}
//
//struct Option: Decodable {
//    let miner: String
//    let minhash: Int
//    let units: String
//}
//
//struct Tag: Decodable {
//    let id: Int
//    let name: String
//    let color, farmsCount, workersCount: Int
//    let isAuto: Bool
//    let farmID, userID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, color
//        case farmsCount = "farms_count"
//        case workersCount = "workers_count"
//        case isAuto = "is_auto"
//        case farmID = "farm_id"
//        case userID = "user_id"
//    }
//}





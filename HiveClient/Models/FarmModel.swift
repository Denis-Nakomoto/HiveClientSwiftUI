//
//  FarmModel.swift
//  HiveClient
//
//  Created by Smart Cash on 24.01.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import Foundation

struct FarmModel: Decodable {

    var data: [Datum]
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    }

struct Datum: Decodable, Identifiable {
    
    let id: Int
    let name, timezone: String
    let nonfree, twofaRequired: Bool
    let gpuRedTemp: String
    let asicRedTemp, gpuRedFan, asicRedFan, gpuRedAsr: Int
    let asicRedAsr, gpuRedLa, asicRedLa: Int
    let autocreateHash: String
    let locked: Bool
    let autoTags: Bool
    let workersCount, rigsCount, asicsCount, disabledRigsCount: Int
    let disabledAsicsCount: Int
    let owner: Owner?
    let money: Money?
    let stats: Stats?
    let hashrates: [Hashrate]?
    let hashratesByCoin: [HashratesByCoin]?
    let chargeOnPool: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case timezone = "timezone"
        case nonfree = "nonfree"
        case twofaRequired = "twofa_required"
        case gpuRedTemp = "gpu_red_temp"
        case asicRedTemp = "asic_red_temp"
        case gpuRedFan = "gpu_red_fan"
        case asicRedFan = "asic_red_fan"
        case gpuRedAsr = "gpu_red_asr"
        case asicRedAsr = "asic_red_asr"
        case gpuRedLa = "gpu_red_la"
        case asicRedLa = "asic_red_la"
        case autocreateHash = "autocreate_hash"
        case locked = "locked"
        case autoTags = "auto_tags"
        case workersCount = "workers_count"
        case rigsCount = "rigs_count"
        case asicsCount = "asics_count"
        case disabledRigsCount = "disabled_rigs_count"
        case disabledAsicsCount = "disabled_asics_count"
        case owner = "owner"
        case money = "money"
        case stats = "stats"
        case hashrates = "hashrates"
        case hashratesByCoin = "hashrates_by_coin"
        case chargeOnPool = "charge_on_pool"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = (try container.decodeIfPresent(Int.self, forKey: .id)) ?? 0
        name = (try container.decodeIfPresent(String.self, forKey: .name)) ?? ""
        timezone = (try container.decodeIfPresent(String.self, forKey: .timezone)) ?? ""
        locked = (try container.decodeIfPresent(Bool.self, forKey: .locked)) ?? false
        nonfree = (try container.decodeIfPresent(Bool.self, forKey: .nonfree)) ?? false
        twofaRequired = (try container.decodeIfPresent(Bool.self, forKey: .twofaRequired)) ?? false
        gpuRedTemp = (try container.decodeIfPresent(String.self, forKey: .gpuRedTemp)) ?? ""
        asicRedTemp = (try container.decodeIfPresent(Int.self, forKey: .asicRedTemp)) ?? 0
        gpuRedFan = (try container.decodeIfPresent(Int.self, forKey: .gpuRedFan)) ?? 0
        asicRedFan = (try container.decodeIfPresent(Int.self, forKey: .asicRedFan)) ?? 0
        gpuRedAsr = (try container.decodeIfPresent(Int.self, forKey: .gpuRedAsr)) ?? 0
        asicRedAsr = (try container.decodeIfPresent(Int.self, forKey: .asicRedAsr)) ?? 0
        gpuRedLa = (try container.decodeIfPresent(Int.self, forKey: .gpuRedLa)) ?? 0
        asicRedLa = (try container.decodeIfPresent(Int.self, forKey: .asicRedLa)) ?? 0
        autocreateHash = (try container.decodeIfPresent(String.self, forKey: .autocreateHash)) ?? ""
        autoTags = (try container.decodeIfPresent(Bool.self, forKey: .autoTags)) ?? false
        workersCount = (try container.decodeIfPresent(Int.self, forKey: .workersCount)) ?? 0
        disabledAsicsCount = (try container.decodeIfPresent(Int.self, forKey: .disabledAsicsCount)) ?? 0
        disabledRigsCount = (try container.decodeIfPresent(Int.self, forKey: .disabledRigsCount)) ?? 0
        hashratesByCoin = (try container.decodeIfPresent([HashratesByCoin].self, forKey: .hashratesByCoin)) ?? nil
        hashrates = (try container.decodeIfPresent([Hashrate].self, forKey: .hashrates)) ?? nil
        money = (try container.decodeIfPresent(Money.self, forKey: .money)) ?? nil
        rigsCount = (try container.decodeIfPresent(Int.self, forKey: .rigsCount)) ?? 0
        asicsCount = (try container.decodeIfPresent(Int.self, forKey: .asicsCount)) ?? 0
        stats = (try container.decodeIfPresent(Stats.self, forKey: .stats)) ?? nil
        owner = (try container.decodeIfPresent(Owner.self, forKey: .owner)) ?? nil
        chargeOnPool = (try container.decodeIfPresent(Bool.self, forKey: .chargeOnPool)) ?? false
    }
}

//
struct HashratesByCoin: Decodable {
    let coin, algo: String
    let hashrate: Double

    enum CodingKeys: String, CodingKey {
        case coin = "coin"
        case algo = "algo"
        case hashrate = "hashrate"
    }
    init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
            algo = (try container.decodeIfPresent(String.self, forKey: .algo)) ?? ""
            coin = (try container.decodeIfPresent(String.self, forKey: .coin)) ?? ""
            hashrate = (try container.decodeIfPresent(Double.self, forKey: .hashrate)) ?? 0.0
      }
}

struct Owner: Decodable {
    let id: Int
    let login, name: String
    let me: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case login = "login"
        case me = "me"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = (try container.decodeIfPresent(Int.self, forKey: .id)) ?? 0
        login = (try container.decodeIfPresent(String.self, forKey: .login)) ?? ""
        name = (try container.decodeIfPresent(String.self, forKey: .name)) ?? ""
        me = (try container.decodeIfPresent(Bool.self, forKey: .me)) ?? false
    }
    
}

struct Hashrate: Decodable {
    let algo: String
    let hashrate: Double
    
    enum CodingKeys: String, CodingKey {
        case algo = "algo"
        case hashrate = "hashrate"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        algo = (try container.decodeIfPresent(String.self, forKey: .algo)) ?? ""
        hashrate = (try container.decodeIfPresent(Double.self, forKey: .hashrate)) ?? 0.0
    }
}


struct Money: Decodable {
    let isPaid, isFree: Bool
    let balance, dailyCost, monthlyCost, pricePerAsic, pricePerRig: Double
    let overdraft: Bool
    let costDetails: [CostDetail]?
    let dailyPrice, monthlyPrice: Double
    let discount, dailyUseRigs, dailyUseAsics: Double
    let dailyUseAccount:Int?

    enum CodingKeys: String, CodingKey {
        case isPaid = "is_paid"
        case isFree = "is_free"
        case balance = "balance"
        case discount = "discount"
        case dailyCost = "daily_cost"
        case monthlyCost = "monthly_cost"
        case overdraft = "overdraft"
        case costDetails = "cost_details"
        case dailyPrice = "daily_price"
        case monthlyPrice = "monthly_price"
        case dailyUseRigs = "daily_use_rigs"
        case dailyUseAsics = "daily_use_asics"
        case pricePerRig = "price_per_rig"
        case pricePerAsic = "price_per_asic"
        case dailyUseAccount = "daily_use_account"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        balance = (try container.decodeIfPresent(Double.self, forKey: .balance)) ?? 0.0
        isPaid = (try container.decodeIfPresent(Bool.self, forKey: .isPaid)) ?? false
        dailyPrice = (try container.decodeIfPresent(Double.self, forKey: .dailyPrice)) ?? 0.0
        dailyUseAccount = (try container.decodeIfPresent(Int.self, forKey: .dailyUseAccount)) ?? nil
        dailyUseAsics = (try container.decodeIfPresent(Double.self, forKey: .dailyUseAsics)) ?? 0
        dailyUseRigs = (try container.decodeIfPresent(Double.self, forKey: .dailyUseRigs)) ?? 0
        discount = (try container.decodeIfPresent(Double.self, forKey: .discount)) ?? 0
        isFree = (try container.decodeIfPresent(Bool.self, forKey: .isFree)) ?? false
        monthlyPrice = (try container.decodeIfPresent(Double.self, forKey: .monthlyPrice)) ?? 0.0
        overdraft = (try container.decodeIfPresent(Bool.self, forKey: .overdraft)) ?? false
        pricePerAsic = (try container.decodeIfPresent(Double.self, forKey: .pricePerAsic)) ?? 0.0
        pricePerRig = (try container.decodeIfPresent(Double.self, forKey: .pricePerRig)) ?? 0.0
        dailyCost = (try container.decodeIfPresent(Double.self, forKey: .dailyCost)) ?? 0.0
        costDetails = (try container.decodeIfPresent([CostDetail].self, forKey: .costDetails)) ?? nil
        monthlyCost = (try container.decodeIfPresent(Double.self, forKey: .monthlyCost)) ?? 0.0
       }
}

struct CostDetail: Decodable {
    let type, monthlyPrice: Int
    let amount, dailyCost, monthlyCost: Double

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case amount = "amount"
        case monthlyPrice = "monthly_price"
        case monthlyCost = "monthly_cost"
        case dailyCost = "daily_cost"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = (try container.decodeIfPresent(Int.self, forKey: .type)) ?? 0
        amount = (try container.decodeIfPresent(Double.self, forKey: .amount)) ?? 0
        monthlyPrice = (try container.decodeIfPresent(Int.self, forKey: .monthlyPrice)) ?? 0
        monthlyCost = (try container.decodeIfPresent(Double.self, forKey: .monthlyCost)) ?? 0
        dailyCost = (try container.decodeIfPresent(Double.self, forKey: .dailyCost)) ?? 0.0
    }
    
    
    
}

struct Stats: Decodable {
    let workersOnline, workersOffline, workersOverheated, workersOverloaded: Int
    let workersInvalid, workersLowAsr, rigsOnline, rigsOffline: Int
    let gpusOnline, gpusOffline, gpusOverheated, asicsOnline: Int
    let asicsOffline, boardsOnline, boardsOffline, boardsOverheated, cpusOnline: Int
    let powerDraw: Int
    let asr: Double

    enum CodingKeys: String, CodingKey {
        case workersOnline = "workers_online"
        case workersOffline = "workers_offline"
        case workersOverheated = "workers_overheated"
        case workersOverloaded = "workers_overloaded"
        case workersInvalid = "workers_invalid"
        case workersLowAsr = "workers_low_asr"
        case rigsOnline = "rigs_online"
        case rigsOffline = "rigs_offline"
        case gpusOnline = "gpus_online"
        case gpusOffline = "gpus_offline"
        case gpusOverheated = "gpus_overheated"
        case asicsOnline = "asics_online"
        case asicsOffline = "asics_offline"
        case boardsOnline = "boards_online"
        case boardsOffline = "boards_offline"
        case boardsOverheated = "boards_overheated"
        case cpusOnline = "cpus_online"
        case powerDraw = "power_draw"
        case asr = "asr"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        workersOnline  = (try container.decodeIfPresent(Int.self, forKey: .workersOnline)) ?? 0
        workersOffline = (try container.decodeIfPresent(Int.self, forKey: .workersOffline)) ?? 0
        workersOverheated = (try container.decodeIfPresent(Int.self, forKey: .workersOverheated)) ?? 0
        workersOverloaded = (try container.decodeIfPresent(Int.self, forKey: .workersOverloaded)) ?? 0
        workersInvalid = (try container.decodeIfPresent(Int.self, forKey: .workersInvalid)) ?? 0
        workersLowAsr = (try container.decodeIfPresent(Int.self, forKey: .workersLowAsr)) ?? 0
        rigsOnline = (try container.decodeIfPresent(Int.self, forKey: .rigsOnline)) ?? 0
        rigsOffline = (try container.decodeIfPresent(Int.self, forKey: .rigsOffline)) ?? 0
        gpusOnline = (try container.decodeIfPresent(Int.self, forKey: .gpusOnline)) ?? 0
        gpusOffline = (try container.decodeIfPresent(Int.self, forKey: .gpusOffline)) ?? 0
        boardsOnline = ( try container.decodeIfPresent(Int.self, forKey: .boardsOnline )) ?? 0
        boardsOffline = (try container.decodeIfPresent(Int.self, forKey: .boardsOffline)) ?? 0
        boardsOverheated = (try container.decodeIfPresent(Int.self, forKey: .boardsOverheated)) ?? 0
        cpusOnline = (try container.decodeIfPresent(Int.self, forKey: .cpusOnline)) ?? 0
        powerDraw = (try container.decodeIfPresent(Int.self, forKey: .powerDraw)) ?? 0
        asr = (try container.decodeIfPresent(Double.self, forKey: .asr)) ?? 0
        gpusOverheated = (try container.decodeIfPresent(Int.self, forKey: .gpusOverheated)) ?? 0
        asicsOnline = (try container.decodeIfPresent(Int.self, forKey: .asicsOnline)) ?? 0
        asicsOffline = (try container.decodeIfPresent(Int.self, forKey: .asicsOffline)) ?? 0
    }
}




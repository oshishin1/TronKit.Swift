import Foundation
import ObjectMapper

public protocol Contract: ImmutableMappable {
    func ownTransaction(ownAddress: Address) -> Bool
}

public struct AccountCreateContract: Contract {
    static let type = "AccountCreateContract"

    let ownerAddress: Address
    let accountAddress: Address
    let type: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountAddress = try map.value("account_address", using: HexAddressTransform())
        type = try map.value("type")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct TransferContract: Contract {
    static let type = "TransferContract"

    public let amount: Int
    public let ownerAddress: Address
    public let toAddress: Address

    public init(amount: Int, ownerAddress: Address, toAddress: Address) {
        self.amount = amount
        self.ownerAddress = ownerAddress
        self.toAddress = toAddress
    }

    public init(map: Map) throws {
        amount = try map.value("amount")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct TransferAssetContract: Contract {
    static let type = "TransferAssetContract"

    let amount: Int
    let assetName: String
    let ownerAddress: Address
    let toAddress: Address

    public init(map: Map) throws {
        amount = try map.value("amount")
        assetName = try map.value("asset_name")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct VoteWitnessContract: Contract {
    static let type = "VoteWitnessContract"

    let ownerAddress: Address
    let votes: [Vote]

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        votes = try map.value("votes")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public struct Vote: ImmutableMappable {
        let voteAddress: Address
        let voteCount: Int

        public init(map: Map) throws {
            voteAddress = try map.value("vote_address", using: HexAddressTransform())
            voteCount = try map.value("vote_count")
        }
    }
}

public struct WitnessCreateContract: Contract {
    static let type = "WitnessCreateContract"

    public let ownerAddress: Address
    public let url: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        url = try map.value("url")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct AssetIssueContract: Contract {
    static let type = "AssetIssueContract"

    public struct FrozenSupply: ImmutableMappable {
        public let frozenAmount: Int
        public let frozenDays: Int

        public init(map: Map) throws {
            frozenAmount = try map.value("frozen_amount")
            frozenDays = try map.value("frozen_days")
        }
    }

    public let ownerAddress: Address
    public let name: String
    public let abbr: String
    public let precision: Int
    public let totalSupply: Int
    public let frozenSupply: FrozenSupply?
    public let trxNum: Int
    public let num: Int
    public let startTime: Int
    public let endTime: Int
    public let order: Int?
    public let voteScore: Int?
    public let description: String?
    public let url: String?
    public let freeAssetNetLimit: Int?
    public let publicFreeAssetNetLimit: Int?
    public let publicFreeAssetNetUsage: Int?
    public let publicLatestFreeNetTime: Int?

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        name = try map.value("name")
        abbr = try map.value("abbr")
        precision = try map.value("precision")
        totalSupply = try map.value("total_supply")
        frozenSupply = try? map.value("frozen_supply")
        trxNum = try map.value("trx_num")
        num = try map.value("num")
        startTime = try map.value("start_time")
        endTime = try map.value("end_time")
        order = try map.value("order")
        voteScore = try map.value("vote_score")
        description = try map.value("description")
        url = try map.value("url")
        freeAssetNetLimit = try map.value("free_asset_net_limit")
        publicFreeAssetNetLimit = try map.value("public_free_asset_net_limit")
        publicFreeAssetNetUsage = try map.value("public_free_asset_net_usage")
        publicLatestFreeNetTime = try map.value("public_latest_free_net_time")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct WitnessUpdateContract: Contract {
    static let type = "WitnessUpdateContract"
    public let ownerAddress: Address
    public let updateUrl: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        updateUrl = try map.value("update_url")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct ParticipateAssetIssueContract: Contract {
    static let type = "ParticipateAssetIssueContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address
    public let toAddress: Address
    public let assetName: String
    public let amount: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
        assetName = try map.value("asset_name")
        amount = try map.value("amount")
    }
}

public struct AccountUpdateContract: Contract {
    static let type = "AccountUpdateContract"

    public let ownerAddress: Address
    public let accountName: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountName = try map.value("account_name")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct FreezeBalanceContract: Contract {
    static let type = "FreezeBalanceContract"

    public let ownerAddress: Address
    public let frozenBalance: Int
    public let frozenDuration: Int
    public let resource: String
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        frozenBalance = try map.value("frozen_balance")
        frozenDuration = try map.value("frozen_duration")
        resource = try map.value("resource")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UnfreezeBalanceContract: Contract {
    static let type = "UnfreezeBalanceContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address
    public let resource: String
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }
}

public struct WithdrawBalanceContract: Contract {
    static let type = "WithdrawBalanceContract"

    let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UnfreezeAssetContract: Contract {
    static let type = "UnfreezeAssetContract"

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UpdateAssetContract: Contract {
    static let type = "UpdateAssetContract"

    public let ownerAddress: Address
    public let description: String
    public let url: String
    public let newLimit: Int
    public let newPublicLimit: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        description = try map.value("description")
        url = try map.value("url")
        newLimit = try map.value("new_limit")
        newPublicLimit = try map.value("new_public_limit")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct ProposalCreateContract: Contract {
    static let type = "ProposalCreateContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct ProposalApproveContract: Contract {
    static let type = "ProposalApproveContract"

    public let ownerAddress: Address
    public let proposalId: Int
    public let isAddApproval: Bool

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        proposalId = try map.value("proposal_id")
        isAddApproval = try map.value("is_add_approval")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct ProposalDeleteContract: Contract {
    static let type = "ProposalDeleteContract"

    public let ownerAddress: Address
    public let proposalId: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        proposalId = try map.value("proposal_id")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct SetAccountIdContract: Contract {
    static let type = "SetAccountIdContract"

    public let ownerAddress: Address
    public let accountId: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountId = try map.value("account_id")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct CreateSmartContract: Contract {
    static let type = "CreateSmartContract"

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct TriggerSmartContract: Contract {
    static let type = "TriggerSmartContract"

    let data: String
    let ownerAddress: Address
    let contractAddress: Address
    let callValue: Int?
    let callTokenValue: Int?
    let tokenId: Int?

    public init(data: String, ownerAddress: Address, contractAddress: Address, callValue: Int?, callTokenValue: Int?, tokenId: Int?) {
        self.data = data
        self.ownerAddress = ownerAddress
        self.contractAddress = contractAddress
        self.callValue = callValue
        self.callTokenValue = callTokenValue
        self.tokenId = tokenId
    }

    public init(map: Map) throws {
        data = try map.value("data")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        callValue = try map.value("call_value")
        callTokenValue = try map.value("call_token_value")
        tokenId = try map.value("token_id")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UpdateSettingContract: Contract {
    static let type = "UpdateSettingContract"

    public let ownerAddress: Address
    public let contractAddress: Address
    public let consumeUserResourcePercent: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        consumeUserResourcePercent = try map.value("consume_user_resource_percent")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct ExchangeCreateContract: Contract {
    static let type = "ExchangeCreateContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct ExchangeInjectContract: Contract {
    static let type = "ExchangeInjectContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct ExchangeWithdrawContract: Contract {
    static let type = "ExchangeWithdrawContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct ExchangeTransactionContract: Contract {
    static let type = "ExchangeTransactionContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct ClearABIContract: Contract {
    static let type = "ClearABIContract"

    public let ownerAddress: Address
    public let contractAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UpdateBrokerageContract: Contract {
    static let type = "UpdateBrokerageContract"

    public let ownerAddress: Address
    public let brokerage: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        brokerage = try map.value("brokerage")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UpdateEnergyLimitContract: Contract {
    static let type = "UpdateEnergyLimitContract"

    public let ownerAddress: Address
    public let contractAddress: Address
    public let originEnergyLimit: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        originEnergyLimit = try map.value("origin_energy_limit")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}


public struct FreezeBalanceV2Contract: Contract {
    static let type = "FreezeBalanceV2Contract"

    let resource: String
    let frozenBalance: Int
    let ownerAddress: Address

    public init(map: Map) throws {
        resource = try map.value("resource")
        frozenBalance = try map.value("frozen_balance")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UnfreezeBalanceV2Contract: Contract {
    static let type = "UnfreezeBalanceV2Contract"

    public let ownerAddress: Address
    public let unfreezeBalance: Int
    public let resource: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        unfreezeBalance = try map.value("unfreeze_balance")
        resource = try map.value("resource")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct WithdrawExpireUnfreezeContract: Contract {
    static let type = "WithdrawExpireUnfreezeContract"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

public struct DelegateResourceContract: Contract {
    static let type = "DelegateResourceContract"

    public let ownerAddress: Address
    public let resource: String
    public let balance: Int
    public let receiverAddress: Address
    public let lock: Bool

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        balance = try map.value("balance")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
        lock = try map.value("lock")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UnDelegateResourceContract: Contract {
    static let type = "UnDelegateResourceContract"

    public let ownerAddress: Address
    public let resource: String
    public let balance: Int
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        balance = try map.value("balance")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

public struct UnknownContract: Contract {
    public let data: Data

    public init(map: Map) throws {
        try self.init(object: map.JSON)
    }

    public init(object: Any) throws {
        self.data = try JSONSerialization.data(withJSONObject: object)
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        false
    }
}
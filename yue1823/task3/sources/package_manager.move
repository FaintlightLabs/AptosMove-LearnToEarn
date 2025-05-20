module coin_factory::package_manager {

    use aptos_framework::object::{ExtendRef, create_named_object, generate_signer, generate_extend_ref,
        create_object_address, generate_signer_for_extending
    };
    friend  coin_factory::create_coin;

    struct AdminControl has key{
        extend:ExtendRef,
        admin:vector<address>
    }
    const Seed :vector<u8> = b"coin factory";

    public fun ensure_admin(admin:address):bool acquires AdminControl {
        let resources_address = get_resources_account_addrress();
        let borrow = borrow_global<AdminControl>(resources_address);
        let (exists , _ )= borrow.admin.find(|t|{*t == admin});
        exists
    }
    public(friend) fun get_signer():signer acquires AdminControl {
        let resources_address = get_resources_account_addrress();
        let borrow = borrow_global<AdminControl>(resources_address);
        generate_signer_for_extending(&borrow.extend)
    }
    public fun get_resources_account_addrress():address{create_object_address(&@coin_factory,Seed)}


    fun init_module(caller:&signer){
        let conf =&create_named_object(caller,Seed);
        let admin_v= vector<address>[];
        admin_v.push_back(@coin_factory);
        move_to(&generate_signer(conf),AdminControl{
            extend:generate_extend_ref(conf),
            admin:admin_v
        });
    }
    #[test_only]
    public fun call_init_module(caller:&signer){
        init_module(caller);
    }
}

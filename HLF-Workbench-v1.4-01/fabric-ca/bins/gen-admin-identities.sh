# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Registers the 3 Org admins for DIGIBANK Case Study
# CA Registrar is already registered & enrolled
# acme-admin, magnetocorp-admin, papernet-admin
# Change this script to add more organizations

# Registers the admins
function registerAdmins {
    # 1. Set the CA Server Admin as FABRIC_CA_CLIENT_HOME
    #    This the Registrar identity
    source set-client-home.sh   caserver   admin

    # 2. Register papernet-admin
    echo "Registering: papernet-admin"
    ATTRIBUTES='"hf.Registrar.Roles=orderer,user,client"'
    fabric-ca-client register --id.type client --id.name papernet-admin --id.secret pw --id.affiliation papernet --id.attrs $ATTRIBUTES
    sleep 100s
    # 3. Register digibank-admin
    echo "Registering: digibank-admin"
    ATTRIBUTES='"hf.Registrar.Roles=peer,user,client","hf.AffiliationMgr=true","hf.Revoker=true"'
    fabric-ca-client register --id.type client --id.name digibank-admin --id.secret pw --id.affiliation digibank --id.attrs $ATTRIBUTES

    # 4. Register magnetocorp-admin
    echo "Registering: magnetocorp-admin"
    ATTRIBUTES='"hf.Registrar.Roles=peer,user,client","hf.AffiliationMgr=true","hf.Revoker=true"'
    fabric-ca-client register --id.type client --id.name magnetocorp-admin --id.secret pw --id.affiliation magnetocorp --id.attrs $ATTRIBUTES
    
    ### Additional Organizations may be added here ###
}

# Setup MSP
function setupMSP {
    mkdir -p $FABRIC_CA_CLIENT_HOME/msp/admincerts

    echo "====> $FABRIC_CA_CLIENT_HOME/msp/admincerts"
    cp $FABRIC_CA_CLIENT_HOME/../../caserver/admin/msp/signcerts/*  $FABRIC_CA_CLIENT_HOME/msp/admincerts
}

# Enroll admin
function enrollAdmins {

    # 1. papernet-admin
    echo "Enrolling: papernet-admin"

    export ORG_NAME="papernet"
    source set-client-home.sh   $ORG_NAME   admin
    # Enroll the admin identity
    fabric-ca-client enroll -u http://papernet-admin:pw@localhost:7054
    # Setup the MSP for the papernet
    setupMSP


    # 2. digibank-admin
    echo "Enrolling: digibank-admin"

    export ORG_NAME="digibank"
    source set-client-home.sh   $ORG_NAME   admin
    # Enroll the admin identity
    fabric-ca-client enroll -u http://digibank-admin:pw@localhost:7054
    # Setup the MSP for digibank
    setupMSP

    # 3. magnetocorp-admin
    echo "Enrolling: magnetocorp-admin"

    export ORG_NAME="magnetocorp"
    source set-client-home.sh   $ORG_NAME   admin
    # Enroll the admin identity
    fabric-ca-client enroll -u http://magnetocorp-admin:pw@localhost:7054
    # Setup the MSP for magnetocorp
    setupMSP

    ### Additional Organizations may be added here ###

}

echo "========= Registering ==============="
#1. CA Registrar will register the Org Admins
registerAdmins

echo "========= Enrolling ==============="
#2. Each Org Admin will then enroll & get the certs
enrollAdmins

echo "==================================="
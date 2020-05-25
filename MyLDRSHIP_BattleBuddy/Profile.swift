//
//  Profile.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/23/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class Profile {
    var profileId : String
    var uid : String
    var firstName : String
//    var profileInfo : ProfileInfo
    
    var lastName : String
    var privateName : String
    var publicEmail : String
    var privateEmail : String
    var phoneNumber : String
    
    var hostSchool : String
    var MScourseEnrollStat : String
    var MSclass : String
    var contractedStat: String
    var commissioningDate: String
    var securityClearStat: String
    var status104R: String
    var statusCPR: String
    
    
    var battleRosterNo: String
    var myPosition: String
    var otherPositions: String
    var BNLvlGrp: String
    var COLvlGrp: String
    var PLTLvlGrp: String
    var SQDLvlGrp: String
    var TMLvlGrp: String
    var specialTeams: String
    
    
    var schoolName: String
    var schoolEnrollStat: String
    var schoolYr: String
    var graduationDate: String
    var majorDegree: String
    var minorDegrees: String
    var greekOrg: String
    var varsityAthletics: String
    var studentOrgs: String

    
    var isPriorService: String
    var yrsPriorService: String
    var isSMP: String
    var whichAGR: String
    var unit: String
    var whichMOS: String
    var prevRank: String
    
    init(documentSnapshot : DocumentSnapshot) {
        self.profileId = documentSnapshot.documentID
        let data = documentSnapshot.data()!
        
        self.uid = data["UID"] as! String
        self.firstName = data["Firstname"] as? String ?? ""
//        self.profileInfo = data["author"] as! Pr
        lastName = ""
        privateName = ""
        publicEmail = ""
        privateEmail = ""
        phoneNumber  = ""
        
        hostSchool = ""
        MScourseEnrollStat = ""
        MSclass = ""
        contractedStat = ""
        commissioningDate = ""
        securityClearStat = ""
        status104R = ""
        statusCPR = ""
        
        
        battleRosterNo = ""
        myPosition = ""
        otherPositions = ""
        BNLvlGrp = ""
        COLvlGrp = ""
        PLTLvlGrp = ""
        SQDLvlGrp = ""
        TMLvlGrp = ""
        specialTeams = ""
        
        
        schoolName = ""
        schoolEnrollStat = ""
        schoolYr = ""
        graduationDate = ""
        majorDegree = ""
        minorDegrees = ""
        greekOrg = ""
        varsityAthletics = ""
        studentOrgs = ""

        
        isPriorService = ""
        yrsPriorService = ""
        isSMP = ""
        whichAGR = ""
        unit = ""
        whichMOS = ""
        prevRank = ""
    }
    
    func addInfo(documentSnapshot: DocumentSnapshot) {
        if documentSnapshot.documentID == "Contact-Info" {
            addContactInfo(documentSnapshot)
        } else if documentSnapshot.documentID == "Program-Info" {
            addProgramInfo(documentSnapshot)
        } else if documentSnapshot.documentID == "Cadet-Org-Info" {
            addCadetOrgInfo(documentSnapshot)
        } else if documentSnapshot.documentID == "School-Info" {
            addSchoolInfo(documentSnapshot)
        } else if documentSnapshot.documentID == "Prior-Service-Info" {
            addPriorServiceInfo(documentSnapshot)
        } else {
            print("Could not find Profile-Info document type: \(documentSnapshot)")
        }
    }
    
    func addContactInfo(_ documentSnapshot: DocumentSnapshot) {
        let data = documentSnapshot.data()!
        
        self.firstName = data["firstName"] as? String ?? ""
        self.lastName = data["lastName"] as? String ?? ""
        self.privateName = data["privateName"] as? String ?? ""
        self.publicEmail = data["publicEmail"] as? String ?? ""
        self.privateEmail = data["privateEmail"] as? String ?? ""
        self.phoneNumber = data["phoneNumber"] as? String ?? ""
    }
    
    func addProgramInfo(_ documentSnapshot: DocumentSnapshot) {
        let data = documentSnapshot.data()!
        
        self.hostSchool = data["hostSchool"] as? String ?? ""
        self.MScourseEnrollStat = data["MScourseEnrollStat"] as? String ?? ""
        self.MSclass = data["MSclass"] as? String ?? ""
        self.contractedStat = data["contractedStat"] as? String ?? ""
        self.commissioningDate = data["commissioningDate"] as? String ?? ""
        self.securityClearStat = data["securityClearStat"] as? String ?? ""
        self.status104R = data["stat10status104R4R"] as? String ?? ""
        self.statusCPR = data["statusCPR"] as? String ?? ""
    }
    
    func addCadetOrgInfo(_ documentSnapshot: DocumentSnapshot){
        let data = documentSnapshot.data()!
        
        self.battleRosterNo = data["battleRosterNo"] as? String ?? ""
        self.myPosition = data["myPosition"] as? String ?? ""
//        self.otherPositions = data["otherPositions"] as? String ?? ""
        self.BNLvlGrp = data["BNLvlGrp"] as? String ?? ""
        self.COLvlGrp = data["COLvlGrp"] as? String ?? ""
        self.PLTLvlGrp = data["PLTLvlGrp"] as? String ?? ""
        self.SQDLvlGrp = data["SQDLvlGrp"] as? String ?? ""
        self.TMLvlGrp = data["TMLvlGrp"] as? String ?? ""
//        self.specialTeams = data["specialTeams"] as? String ?? ""
    }
    
    func addSchoolInfo(_ documentSnapshot: DocumentSnapshot) {
        let data = documentSnapshot.data()!
        
        self.schoolName = data["schoolName"] as? String ?? ""
        self.schoolEnrollStat = data["schoolEnrollStat"] as? String ?? ""
        self.schoolYr = data["schoolYr"] as? String ?? ""
        self.graduationDate = data["graduationDate"] as? String ?? ""
        self.majorDegree = data["majorDegree"] as? String ?? ""
//        self.minorDegrees = data["minorDegrees"] as? [String] ?? ""
        self.greekOrg = data["greekOrg"] as? String ?? ""
//        self.varsityAthletics = data["varsityAthletics"] as? [String] ?? ""
//        self.studentOrgs = data["studentOrgs"] as? [String] ?? ""
    }
    

    func addPriorServiceInfo(_ documentSnapshot: DocumentSnapshot) {
        let data = documentSnapshot.data()!
        
        self.isPriorService = data["isPriorService"] as? String ?? ""
        self.yrsPriorService = data["yrsPriorService"] as? String ?? ""
        self.isSMP = data["isSMP"] as? String ?? ""
        self.whichAGR = data["whichAGR"] as? String ?? ""
        self.unit = data["unit"] as? String ?? ""
        self.whichMOS = data["whichMOS"] as? String ?? ""
        self.prevRank = data["prevRank"] as? String ?? ""
    }
}

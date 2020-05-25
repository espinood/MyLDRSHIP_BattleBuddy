//
//  ProfileViewController.swift
//  MyLDRSHIP_BattleBuddy
//
//  Created by CSSE Department on 5/18/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController : UIViewController {
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var privateNameTF: UITextField!
    @IBOutlet weak var publicEmailTF: UITextField!
    @IBOutlet weak var privateEmailTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    
    var didFirstNameChange : Bool = false
    var didLastNameChange : Bool = false
    var didPrivateNameChange : Bool = false
    var didPublicEmailChange : Bool = false
    var didPrivateEmailChange : Bool = false
    var didPhoneNoChange : Bool = false
    
    @IBOutlet weak var hostSchoolTF: UITextField!
    @IBOutlet weak var MScourseEnrollTF: UITextField!
    @IBOutlet weak var MSclassTF: UITextField!
    @IBOutlet weak var contractedStatTF: UITextField!
    @IBOutlet weak var commissDateTF: UITextField!
    @IBOutlet weak var secClearStatTF: UITextField!
    @IBOutlet weak var stat104R: UITextField!
    @IBOutlet weak var statCPR: UITextField!
    
    var didHostSchoolChange : Bool = false
    var didMScourseEnrollChange : Bool = false
    var didMSclassChange : Bool = false
    var didContractedStatChange : Bool = false
    var didCommissDateChange : Bool = false
    var didSecClearStatChange : Bool = false
    var didStat104RChange : Bool = false
    var didStatCPRChange : Bool = false
    
    @IBOutlet weak var battleRosterNoTF: UITextField!
    @IBOutlet weak var myPosTF: UITextField!
    @IBOutlet weak var specialPosTF: UITextField!
    @IBOutlet weak var BNLvlGrp: UITextField!
    @IBOutlet weak var COLvlGrp: UITextField!
    @IBOutlet weak var PLTLvlGrp: UITextField!
    @IBOutlet weak var SQDLvlGrp: UITextField!
    @IBOutlet weak var TMLvlGrp: UITextField!
    @IBOutlet weak var specialTeamsTF: UITextField!
    
    var didBattleRosterNoChange : Bool = false
    var didMyPosChange : Bool = false
    var didSpecialPosChange : Bool = false
    var didBNLvlGrpChange : Bool = false
    var didCOLvlGrpChange : Bool = false
    var didPLTLvlGrpChange : Bool = false
    var didSQDLvlGrpChange : Bool = false
    var didTMLvlGrpChange : Bool = false
    var didSpecialTeamsChange : Bool = false
    
    @IBOutlet weak var schoolTF: UITextField!
    @IBOutlet weak var enrollStatTF: UITextField!
    @IBOutlet weak var schoolYrTF: UITextField!
    @IBOutlet weak var gradDateTF: UITextField!
    @IBOutlet weak var majorTF: UITextField!
    @IBOutlet weak var minorTF: UITextField!
    @IBOutlet weak var greekOrgTF: UITextField!
    @IBOutlet weak var athleticsTF: UITextField!
    @IBOutlet weak var studentOrgsTF: UITextField!
    
    var didSchoolChange : Bool = false
    var didEnrollStatChange : Bool = false
    var didSchoolYrChange : Bool = false
    var didGradDateChange : Bool = false
    var didMajorChange : Bool = false
    var didMinorChange : Bool = false
    var didGreekOrgChange : Bool = false
    var didAthleticsChange : Bool = false
    var didStudentOrgsChange : Bool = false
    
    @IBOutlet weak var priorServiceTf: UITextField!
    @IBOutlet weak var yrsPriorServiceTF: UITextField!
    @IBOutlet weak var smpTF: UITextField!
    @IBOutlet weak var agrTF: UITextField!
    @IBOutlet weak var unitTF: UITextField!
    @IBOutlet weak var mosTF: UITextField!
    @IBOutlet weak var prevRankTF: UITextField!
    
    var didPriorServiceChange : Bool = false
    var didYrsPriorServiceChange : Bool = false
    var didSmpChange : Bool = false
    var didAgrChange : Bool = false
    var didUnitChange : Bool = false
    var didMosChange : Bool = false
    var didPrevRankChange : Bool = false
    
    @IBAction func FirstNameChanged(_ sender: Any) {didFirstNameChange = true}
    @IBAction func LastNameChanged(_ sender: Any) { didLastNameChange = true}
    @IBAction func PrivateNameChanged(_ sender: Any) { didPrivateNameChange = true}
    @IBAction func PublicEmailChanged(_ sender: Any) { didPublicEmailChange = true}
    @IBAction func PrivateEmailChanged(_ sender: Any) { didPrivateEmailChange = true}
    @IBAction func PhoneNoChanged(_ sender: Any) { didPhoneNoChange = true}
    
    @IBAction func HostSchoolChanged(_ sender: Any) { didHostSchoolChange = true}
    @IBAction func MScourseEnrollChanged(_ sender: Any) { didMScourseEnrollChange = true}
    @IBAction func MSclassChanged(_ sender: Any) { didMSclassChange = true}
    @IBAction func ContractedStatChanged(_ sender: Any) { didContractedStatChange = true}
    @IBAction func CommissDateChanged(_ sender: Any) { didCommissDateChange = true}
    @IBAction func SecClearStatChanged(_ sender: Any) { didSecClearStatChange = true}
    @IBAction func Stat104RChanged(_ sender: Any) { didStat104RChange = true}
    @IBAction func StatCPRChanged(_ sender: Any) { didStatCPRChange = true}
    
    @IBAction func BattleRosterNoChanged(_ sender: Any) { didBattleRosterNoChange = true}
    @IBAction func MyPosChanged(_ sender: Any) { didMyPosChange = true}
    @IBAction func SpecialPosChanged(_ sender: Any) { didSpecialPosChange = true}
    @IBAction func BNLvlGrpChanged(_ sender: Any) { didBNLvlGrpChange = true}
    @IBAction func COLvlGrpChanged(_ sender: Any) { didCOLvlGrpChange = true}
    @IBAction func PLTLvlGrpChanged(_ sender: Any) { didPLTLvlGrpChange = true}
    @IBAction func SQDLvlGrpChanged(_ sender: Any) { didSQDLvlGrpChange = true}
    @IBAction func TMLvlGrpChanged(_ sender: Any) { didTMLvlGrpChange = true}
    @IBAction func SpecialTeamsChanged(_ sender: Any) { didSpecialTeamsChange = true}
    
    @IBAction func SchoolChanged(_ sender: Any) { didSchoolChange = true}
    @IBAction func EnrollStatChanged(_ sender: Any) { didEnrollStatChange = true}
    @IBAction func SchoolYrChanged(_ sender: Any) { didSchoolYrChange = true}
    @IBAction func GradDateChanged(_ sender: Any) { didGradDateChange = true}
    @IBAction func MajorChanged(_ sender: Any) { didMajorChange = true}
    @IBAction func MinorChanged(_ sender: Any) { didMinorChange = true}
    @IBAction func GreekOrgChanged(_ sender: Any) { didGreekOrgChange = true}
    @IBAction func AthleticsChanged(_ sender: Any) { didAthleticsChange = true}
    @IBAction func StudentOrgsChanged(_ sender: Any) { didStudentOrgsChange = true}
    
    @IBAction func PriorServiced(_ sender: Any) { didPriorServiceChange = true}
    @IBAction func YrsPriorServiceChanged(_ sender: Any) { didYrsPriorServiceChange = true}
    @IBAction func SmpChanged(_ sender: Any) { didSmpChange = true}
    @IBAction func AgrChanged(_ sender: Any) { didAgrChange = true}
    @IBAction func UnitChanged(_ sender: Any) { didUnitChange = true}
    @IBAction func MosChanged(_ sender: Any) { didMosChange = true}
    @IBAction func PrevRankChanged(_ sender: Any) { didPrevRankChange = true}
    
    
    var profile : Profile?
    var profileRef : DocumentReference!
    var profileInfoRef : CollectionReference!
    
    var isUpdatingProfile : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.rightBarButtonItem = UIBarButtonItem(title: isUpdatingProfile ? "Confirm Changes" : "Update Profile",
                                                    style: UIBarButtonItem.Style.plain,
                                                    target: self, action:                          #selector(showUpdateProfilePopUp))
    }
    
    @objc func showUpdateProfilePopUp() {
        let alertController = UIAlertController(title: nil,
                                                message: isUpdatingProfile ? "Confirm changes" : "Would you like to update your profile?",
                                                preferredStyle: .alert)
        // Configure
        
        alertController.addAction(UIAlertAction(title: self.isUpdatingProfile ? "Confirm" : "Yes",
                                                style: .default) { (action) in
                                                    
                                                    self.isUpdatingProfile = !self.isUpdatingProfile
                                                    
                                                    self.navBar.rightBarButtonItem?.title = self.isUpdatingProfile ? "Confirm Changes" : "Update Profile"
                                                    
                                                    self.confirmChanges()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    func confirmChanges(){
        if !isUpdatingProfile {
            print("Done updating")
            activateTextFieldBoxes(isUpdatingProfile)
        } else {
            activateTextFieldBoxes(isUpdatingProfile)
            
            if (didFirstNameChange) {
                profileInfoRef.document("Contact-Info").updateData(["firstName" : firstNameTF.text!])
                didFirstNameChange = !didFirstNameChange
            }
            if (didLastNameChange) {
                profileInfoRef.document("Contact-Info").updateData(["lastName" : lastNameTF.text!])
                didLastNameChange = !didLastNameChange
            }
            if (didPrivateNameChange) {
                profileInfoRef.document("Contact-Info").updateData(["privateName" : privateNameTF.text!])
                didPrivateNameChange = !didPrivateNameChange
            }
            if (didPublicEmailChange) {
                profileInfoRef.document("Contact-Info").updateData([ "publicEmail" : publicEmailTF.text!])
                didPublicEmailChange = !didPublicEmailChange
            }
            if (didPrivateEmailChange) {
                profileInfoRef.document("Contact-Info").updateData(["privateEmail" : privateEmailTF.text!])
                didPrivateEmailChange = !didPrivateEmailChange
            }
            if (didPhoneNoChange) {
                profileInfoRef.document("Contact-Info").updateData(["phoneNumber" : phoneNoTF.text!])
                didPhoneNoChange = !didPhoneNoChange
            }
            
            
            if (didHostSchoolChange) {
                profileInfoRef.document("Program-Info").updateData(["hostSchool" : hostSchoolTF.text!])
                didHostSchoolChange = !didHostSchoolChange
            }
            if (didMScourseEnrollChange) {
                profileInfoRef.document("Program-Info").updateData(["MScourseEnrollStat" : MScourseEnrollTF.text!])
                didMScourseEnrollChange = !didMScourseEnrollChange
            }
            if (didMSclassChange) {
                profileInfoRef.document("Program-Info").updateData(["MSclass" : MSclassTF.text!])
                didMSclassChange = !didMSclassChange
            }
            if (didContractedStatChange) {
                profileInfoRef.document("Program-Info").updateData(["contractedStat" : contractedStatTF.text!])
                didContractedStatChange = !didContractedStatChange
            }
            if (didCommissDateChange) {
                profileInfoRef.document("Program-Info").updateData(["commissioningDate" : commissDateTF.text!])
                didCommissDateChange = !didCommissDateChange
            }
            if (didSecClearStatChange) {
                profileInfoRef.document("Program-Info").updateData(["securityClearStat" : secClearStatTF.text!])
                didSecClearStatChange = !didSecClearStatChange
            }
            if (didStat104RChange) {
                profileInfoRef.document("Program-Info").updateData(["status104R" : stat104R.text!])
                didStat104RChange = !didStat104RChange
            }
            if (didStatCPRChange) {
                profileInfoRef.document("Program-Info").updateData(["statusCPR" : statCPR.text!])
                didStatCPRChange = !didStatCPRChange
            }
            
            
            if (didBattleRosterNoChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["battleRosterNo" : battleRosterNoTF.text!])
                didBattleRosterNoChange = !didBattleRosterNoChange
            }
            if (didMyPosChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["myPosition" : myPosTF.text!])
                didMyPosChange = !didMyPosChange
            }
    //                if (didSpecialPosChange) {
    //                    profileInfoRef.document("Cadet-Org-Info").updateData(["otherPositions" : specialPosTF.text!])
    //                    didSpecialPosChange = !didSpecialPosChange
    //        }
            if (didBNLvlGrpChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["BNLvlGrp" : BNLvlGrp.text!])
                didBNLvlGrpChange = !didBNLvlGrpChange
            }
            if (didCOLvlGrpChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["COLvlGrp" : COLvlGrp.text!])
                didCOLvlGrpChange = !didCOLvlGrpChange
            }
            if (didPLTLvlGrpChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["PLTLvlGrp" : PLTLvlGrp.text!])
                didPLTLvlGrpChange = !didPLTLvlGrpChange
            }
            if (didSQDLvlGrpChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["SQDLvlGrp" : SQDLvlGrp.text!])
                didSQDLvlGrpChange = !didSQDLvlGrpChange
            }
            if (didTMLvlGrpChange) {
                profileInfoRef.document("Cadet-Org-Info").updateData(["TMLvlGrp" : TMLvlGrp.text!])
                didTMLvlGrpChange = !didTMLvlGrpChange
            }
    //                if (didSpecialTeamsChange) {
    //                    profileInfoRef.document("Cadet-Org-Info").updateData(["specialTeams" : specialTeamsTF.text!])
    //                    didSpecialTeamsChange = !didSpecialTeamsChange
    //        }
            
            
            if (didSchoolChange) {
                profileInfoRef.document("School-Info").updateData(["schoolName" : schoolTF.text!])
                didSchoolChange = !didSchoolChange
            }
            if (didEnrollStatChange) {
                profileInfoRef.document("School-Info").updateData(["schoolEnrollStat" : enrollStatTF.text!])
                didEnrollStatChange = !didEnrollStatChange
            }
            if (didSchoolYrChange) {
                profileInfoRef.document("School-Info").updateData(["schoolYr" :  schoolYrTF.text!])
                didSchoolYrChange = !didSchoolYrChange
            }
            if (didGradDateChange) {
                profileInfoRef.document("School-Info").updateData(["graduationDate" : gradDateTF.text!])
                didGradDateChange = !didGradDateChange
            }
            if (didMajorChange) {
                profileInfoRef.document("School-Info").updateData(["majorDegree" : majorTF.text!])
                didMajorChange = !didMajorChange
            }
    //                if (didMinorChange) {
    //                    profileInfoRef.document("School-Info").updateData(["minorDegrees" : minorTF.text!])
    //                    didMinorChange = !didMinorChange
    //        }
            if (didGreekOrgChange) {
                profileInfoRef.document("School-Info").updateData(["greekOrg" : greekOrgTF.text!])
                didGreekOrgChange = !didGreekOrgChange
            }
    //                if (didAthleticsChange) {
    //                    profileInfoRef.document("School-Info").updateData(["varsityAthletics" : athleticsTF.text!])
    //                    didAthleticsChange = !didAthleticsChange
    //        }
    //                if (didStudentOrgsChange) {
    //                    profileInfoRef.document("School-Info").updateData(["studentOrgs" : studentOrgsTF.text!])
    //                    didStudentOrgsChange = !didStudentOrgsChange
    //        }
            
            
    //                if (didPriorServiceChange) {
    //                    profileInfoRef.document("Prior-Service-Org-Info").updateData(["isPriorService" : priorServiceTf.text!])
    //                    didPriorServiceChange = !didPriorServiceChange
    //        }
            if (didYrsPriorServiceChange) {
                profileInfoRef.document("Prior-Service-Org-Info").updateData(["yrsPriorService" : yrsPriorServiceTF.text!])
                didYrsPriorServiceChange = !didYrsPriorServiceChange
            }
    //                if (didSmpChange) {
    //                    profileInfoRef.document("Prior-Service-Org-Info").updateData(["isSMP" : smpTF.text!])
    //                    didSmpChange = !didSmpChange
    //        }
            if (didAgrChange) {
                profileInfoRef.document("Prior-Service-Org-Info").updateData(["whichAGR" : agrTF.text!])
                didAgrChange = !didAgrChange
            }
            if (didUnitChange) {
                profileInfoRef.document("Prior-Service-Org-Info").updateData(["unit" : unitTF.text!])
                didUnitChange = !didUnitChange
            }
            if (didMosChange) {
                profileInfoRef.document("Prior-Service-Org-Info").updateData(["whichMOS" : mosTF.text!])
                didMosChange = !didMosChange
            }
            if (didPrevRankChange) {
                profileInfoRef.document("Prior-Service-Org-Info").updateData(["prevRank" : prevRankTF.text!])
                didPrevRankChange = !didPrevRankChange
            }
        }
    }
    
    func activateTextFieldBoxes(_ activated : Bool) {
        var bordSty : UITextField.BorderStyle
        if activated {
            bordSty = .bezel
        } else {
            bordSty = .none
        }
        
        firstNameTF.borderStyle = bordSty
        lastNameTF.borderStyle = bordSty
        privateNameTF.borderStyle = bordSty
        publicEmailTF.borderStyle = bordSty
        privateEmailTF.borderStyle = bordSty
        phoneNoTF.borderStyle = bordSty
        
        hostSchoolTF.borderStyle = bordSty
        MScourseEnrollTF.borderStyle = bordSty
        MSclassTF.borderStyle = bordSty
        contractedStatTF.borderStyle = bordSty
        commissDateTF.borderStyle = bordSty
        secClearStatTF.borderStyle = bordSty
        stat104R.borderStyle = bordSty
        statCPR.borderStyle = bordSty
        
        battleRosterNoTF.borderStyle = bordSty
        myPosTF.borderStyle = bordSty
        specialPosTF.borderStyle = bordSty
        BNLvlGrp.borderStyle = bordSty
        COLvlGrp.borderStyle = bordSty
        PLTLvlGrp.borderStyle = bordSty
        SQDLvlGrp.borderStyle = bordSty
        TMLvlGrp.borderStyle = bordSty
        specialTeamsTF.borderStyle = bordSty
        
        schoolTF.borderStyle = bordSty
        enrollStatTF.borderStyle = bordSty
        schoolYrTF.borderStyle = bordSty
        gradDateTF.borderStyle = bordSty
        majorTF.borderStyle = bordSty
        minorTF.borderStyle = bordSty
        greekOrgTF.borderStyle = bordSty
        athleticsTF.borderStyle = bordSty
        studentOrgsTF.borderStyle = bordSty
        
        priorServiceTf.borderStyle = bordSty
        yrsPriorServiceTF.borderStyle = bordSty
        smpTF.borderStyle = bordSty
        agrTF.borderStyle = bordSty
        unitTF.borderStyle = bordSty
        mosTF.borderStyle = bordSty
        prevRankTF.borderStyle = bordSty
        
        if !activated {
            firstNameTF.layer.borderWidth = 0
            lastNameTF.layer.borderWidth = 0
            privateNameTF.layer.borderWidth = 0
            publicEmailTF.layer.borderWidth = 0
            privateEmailTF.layer.borderWidth = 0
            phoneNoTF.layer.borderWidth = 0
            
            hostSchoolTF.layer.borderWidth = 0
            MScourseEnrollTF.layer.borderWidth = 0
            MSclassTF.layer.borderWidth = 0
            contractedStatTF.layer.borderWidth = 0
            commissDateTF.layer.borderWidth = 0
            secClearStatTF.layer.borderWidth = 0
            stat104R.layer.borderWidth = 0
            statCPR.layer.borderWidth = 0
            
            battleRosterNoTF.layer.borderWidth = 0
            myPosTF.layer.borderWidth = 0
            specialPosTF.layer.borderWidth = 0
            BNLvlGrp.layer.borderWidth = 0
            COLvlGrp.layer.borderWidth = 0
            PLTLvlGrp.layer.borderWidth = 0
            SQDLvlGrp.layer.borderWidth = 0
            TMLvlGrp.layer.borderWidth = 0
            specialTeamsTF.layer.borderWidth = 0
            
            schoolTF.layer.borderWidth = 0
            enrollStatTF.layer.borderWidth = 0
            schoolYrTF.layer.borderWidth = 0
            gradDateTF.layer.borderWidth = 0
            majorTF.layer.borderWidth = 0
            minorTF.layer.borderWidth = 0
            greekOrgTF.layer.borderWidth = 0
            athleticsTF.layer.borderWidth = 0
            studentOrgsTF.layer.borderWidth = 0
            
            priorServiceTf.layer.borderWidth = 0
            yrsPriorServiceTF.layer.borderWidth = 0
            smpTF.layer.borderWidth = 0
            agrTF.layer.borderWidth = 0
            unitTF.layer.borderWidth = 0
            mosTF.layer.borderWidth = 0
            prevRankTF.layer.borderWidth = 0
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameTF.text = profile?.firstName
        lastNameTF.text = profile?.lastName
        privateNameTF.text = profile?.privateName
        publicEmailTF.text = profile?.publicEmail
        privateEmailTF.text = profile?.privateEmail
        phoneNoTF.text = profile?.phoneNumber
        
        hostSchoolTF.text = profile?.hostSchool
        MScourseEnrollTF.text = profile?.MScourseEnrollStat
        MSclassTF.text = profile?.MSclass
        contractedStatTF.text = profile?.contractedStat
        commissDateTF.text = profile?.commissioningDate
        secClearStatTF.text = profile?.securityClearStat
        stat104R.text = profile?.status104R
        statCPR.text = profile?.statusCPR
        
        battleRosterNoTF.text = profile?.battleRosterNo
        myPosTF.text = profile?.myPosition
        specialPosTF.text = profile?.otherPositions
        BNLvlGrp.text = profile?.BNLvlGrp
        COLvlGrp.text = profile?.COLvlGrp
        PLTLvlGrp.text = profile?.PLTLvlGrp
        SQDLvlGrp.text = profile?.SQDLvlGrp
        TMLvlGrp.text = profile?.TMLvlGrp
        specialTeamsTF.text = profile?.specialTeams
        
        schoolTF.text = profile?.schoolName
        enrollStatTF.text = profile?.schoolEnrollStat
        schoolYrTF.text = profile?.schoolYr
        gradDateTF.text = profile?.graduationDate
        majorTF.text = profile?.majorDegree
        minorTF.text = profile?.minorDegrees
        greekOrgTF.text = profile?.greekOrg
        athleticsTF.text = profile?.varsityAthletics
        studentOrgsTF.text = profile?.studentOrgs
        
        priorServiceTf.text = profile?.isPriorService
        yrsPriorServiceTF.text = profile?.yrsPriorService
        smpTF.text = profile?.isSMP
        agrTF.text = profile?.whichAGR
        unitTF.text = profile?.unit
        mosTF.text = profile?.whichMOS
        prevRankTF.text = profile?.prevRank
        
        activateTextFieldBoxes(false)
    }
}

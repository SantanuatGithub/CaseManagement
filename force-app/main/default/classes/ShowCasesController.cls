/**
 *  @name ShowCasesController
 *  @description It is used to return Case records to LWC
 *  @author Santanu Pal
 *  @date dec, 2020
 */
public with sharing class ShowCasesController {
   
 
  /**
   * @name getCases
   * @description It is used to return Case records
   * @param 
   */
  @AuraEnabled(cacheable=true)
  public static List<Case> getCases() {
    List<Case> caseList = new List<Case>(); 

    caseList = [SELECT Id, 
                       CaseNumber, 
                       Origin, 
                       Status, 
                       Subject, 
                       CreatedDate
                       FROM Case
                       LIMIT 15];    

    if(caseList != null && !caseList.isEmpty()) {
        return caseList;
    }

    return null;
  }
}

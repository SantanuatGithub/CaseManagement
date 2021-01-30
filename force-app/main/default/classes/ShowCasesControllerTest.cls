/**
 *  @name ShowCasesControllerTest
 *  @description It is the test class of ShowCasesController
 *  @author Santanu Pal
 *  @date dec, 2020
 */
@isTest
private class ShowCasesControllerTest {
    
    @TestSetup
    static void createData(){ 
        
        Profile profileObj = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User userObj = new User(Alias = 'std', 
                                Email='stduser@testorg.com',
                                EmailEncodingKey='UTF-8',
                                LanguageLocaleKey='en_US',
                                LocaleSidKey='en_US',
                                TimeZoneSidKey='America/Los_Angeles',
                                LastName='TestUser', 
                                ProfileId = profileObj.Id,
                                UserName='stduser' + DateTime.now().getTime() + '@testorg.com');

        insert userObj;
        
        Case caseObj = new Case(Subject = 'Internet is not working in my machine', 
                                Status = 'New', 
                                Origin='Web');
        insert caseObj;
    }

    static testMethod void testGetCases(){

        User stdUserObj = [SELECT Id FROM User WHERE Alias = 'std'];

        List<case> caseList = new List<Case>();

        System.runAs(stdUserObj){
            Test.startTest();
                caseList = ShowCasesController.getCases();
            Test.stopTest();
        }

        System.assertEquals(1, caseList.size());

    }

    
    
}

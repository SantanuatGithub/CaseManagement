import { LightningElement, wire } from "lwc";
import getCases from "@salesforce/apex/ShowCasesController.getCases";

export default class CustomerCases extends LightningElement {
  cases = [];
  error;  

  
  @wire(getCases)
     wiredProperty({data, error}){
         if(data){
             this.cases = data;
             this.error = undefined;
         }
          else if (error) {
              this.error = error;
              this.cases = undefined;
          }
      }

}

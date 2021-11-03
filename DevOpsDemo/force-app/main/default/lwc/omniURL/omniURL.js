import { LightningElement, track} from 'lwc';
import getOmniURL from '@salesforce/apex/OmniController.getOmniURL';
export default class OmniURL extends LightningElement {
    @track OmniURL;
    connectedCallback(){
        getOmniURL()
        .then(ProfileURL=>{
            
            this.OmniURL = ProfileURL;
        })
        .catch(error=>{
            this.OmniURL = 'none';
        })
    }
    launchOmni(event) { 
        omni = window.open(this.OmniURL,"Omni");
    }
}
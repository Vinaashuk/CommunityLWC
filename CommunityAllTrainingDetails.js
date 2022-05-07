import { LightningElement, api } from "lwc";
import communityMethod from "@salesforce/apex/CommunityAllTrainingDetailsClass.communityMethod";
import { NavigationMixin } from "lightning/navigation";

export default class CommunityAllTrainingDetails extends NavigationMixin(LightningElement) {
    @api trainingType;
    //@api trainingType = "All";
    trainingList;
    connectedCallback() {
        communityMethod({ trainingType: this.trainingType }).then((data) => {
            this.trainingList = data;
            console.log("COMMUNITY " + JSON.stringify(this.trainingList));
        });
    }
    buttonHandler(event) {
        var courseLink = event.target.name;
        console.log("COURSE is " + courseLink);
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
                url: courseLink
            }
        });
    }
}

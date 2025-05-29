import { api,LightningElement } from "lwc";
import getRoast from "@salesforce/apex/AIRoastService.getRoast";

export default class RoastViewer extends LightningElement {
  @api recordId;
  isLoading = false;
   roastData = {};
   roastEntries = [];
  columns = [
        { label: '🧠 What\'s Annoying', fieldName: 'key',wrapText: 'true' },
        { label: '💬 Fix', fieldName: 'value',wrapText: 'true' }
    ];
   hasRoast = false;
   emoji = '';
  annoyedEmojis = ['😒', '🙄', '😑', '😤', '😠'];

  handleClick() {
    this.isLoading = true;
    if (!this.recordId) return;

    getRoast({ recordId: this.recordId })
      .then(result => {
        let counter = 0;
        this.roastEntries = Object.entries(JSON.parse(result)).map(([key, value]) => ({
                id: counter++,
                key,
                value
            }));
        this.roastData = result;
        this.hasRoast = true;
        if (this.hasRoast) {
          const randomIndex = Math.floor(Math.random() * this.annoyedEmojis.length);
          this.emoji = this.annoyedEmojis[randomIndex];
        }
      })
      .catch(error => {
        this.roastData = { '❌ Roast Failed': error.body?.message || 'Unknown error' };
        this.hasRoast = true;
        this.emoji = '😵‍💫';
      })
      .finally(() => {
        this.isLoading = false;
      });
  }

  get roastKeys() {
    return Object.keys(this.roastData);
  }
}
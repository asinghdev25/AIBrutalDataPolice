# 🔥 AI Brutal Data Police: Light Up Your Data Hygiene

AI Brutal Data Police is a fun and functional Salesforce tool that calls out bad CRM hygiene using the power of **AI + LWC**. From lazy opportunity names to bad data in Opportunity, this app delivers **real-time, emoji-laced roast feedback** and helpful cleanup tips — directly in the Salesforce UI.

---

## 🧩 Features

- 🎯 **Lightning Web Component** that adds a Roast button to record pages.
- 🤖 **Prompt Template** (Generative AI feature of Salesforce) to generate witty AI feedback.
- ⚙️ **Apex Controller** to invoke the prompt and return JSON roast results.
- 📊 **Dynamic Roast Display**: Shows emoji + roast + recommended fix in a Lightning DataTable.
- 📍 **Installable on Opportunity Record Page** for immediate context-aware roasting.

---

## 📦 Components

### 1. **Lightning Web Component (`RoastViewer`)**

- A simple UI with a big "Roast This Record" button.
- On click:
  - Calls Apex to generate roast from the `AIRoastPromptTemp` prompt template.
  - Parses the JSON result (emoji → roast message,Emoji - fix recommendation).
  - Displays it as a high-contrast, dynamic table (using `lightning-datatable`).
  - Shows a random "annoyed" emoji up top if roast exists.

> 📌 **Deploy it and add it to the Opportunity record page to see context-aware feedback.**

---

### 2. **Prompt Template (`AIRoastPromptTemp`)**

- Built using Salesforce Prompt Builder.
- Type - Flex template
- Dynamically receives record details:
- Takes Opportunity Id record as input and stores input and output examples
- Returns roast + fix suggestions in structured JSON (with random emojis).

Example output:

```json
{
  "💀": "No emails logged? This opportunity is like a book with blank pages. 📚",
  "📎 Clippy Suggestion": "Start tracking communications. Document interactions.",
  "🙄": "Close date in 2025? Guess we're in a time machine. 🚀",
  "🧽 Clean-Up Advice": "Move this to a realistic timeline."
}
```

---

### 3. **Apex Controller (`AIRoastController`)**

- Takes an Opporutnity Id as input
- Creates the configs and input params ready for prompt template
- Makes callout to prompt template
- Parses the output JSON and sends to LWC.

---

## 🛠️ How to Use

### 🚀 Deploy to Salesforce

1. Push project via SFDX:
   ```bash
   sfdx force:source:push
   ```

2. Make sure you have a new Agentforce supporting sandbox for this.

3. Ensure `AIRoastPromptTemp` is published in Prompt Builder and activated

---

### 🎯 Add Component to Record Page

1. Go to any **Opportunity** record.
2. Click **Setup (⚙️) > Edit Page**.
3. Drag `RoastViewer` onto the page.
4. Save and activate.

---

## 👀 Demo

Find it on my linkedin post

---

## 💡 Credits

Developed by yours truly who’s seen enough "Test Opportunities" to being there on Org for forever.

---

## 🧙‍♂️ Want Help?

DM or connect with me on [LinkedIn](https://www.linkedin.com/in/amarjit-singh-b37b23165). follow to find more quarky and interesting projects.

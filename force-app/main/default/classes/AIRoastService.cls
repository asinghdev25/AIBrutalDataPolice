/* Purpose - Class acts as controller for roast ai lwc component.
 *           handles database interactions for roast ai lwc component.
 * Author  - Amarjit Singh
 */
public with sharing class AIRoastService {
    @AuraEnabled(cacheable=false)
    public static String getRoast(Id recordId) {

        // Create inputs
        ConnectApi.WrappedValue inputWrappedValue = new ConnectApi.WrappedValue();
        inputWrappedValue.value = new Map<String, String>{'id' => recordId};
        Map<String, ConnectApi.WrappedValue> inputParams = new Map<String, ConnectApi.WrappedValue>();
        inputParams.put('Input:OppRec', inputWrappedValue);

        // Configure invocation parameters
        ConnectApi.EinsteinPromptTemplateGenerationsInput promptTemplateInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
        promptTemplateInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
        promptTemplateInput.additionalConfig.applicationName = 'PromptTemplateGenerationsInvocable';
        promptTemplateInput.isPreview = false;
        promptTemplateInput.inputParams = inputParams;

        try {
            // Call the service
            ConnectApi.EinsteinPromptTemplateGenerationsRepresentation generationsOutput = ConnectApi.EinsteinLLM.generateMessagesForPromptTemplate(
                'AIRoastPromptTemp',
                promptTemplateInput
            );
            ConnectApi.EinsteinLLMGenerationItemOutput response = generationsOutput.generations[0];
            return response.text;
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw e;
        }
    }
}
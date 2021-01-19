public class JsonParser {
    @AuraEnabled(cacheable=true)
    public static String getProducts(){
        String prInput='{"3": { "entity_id": "3", "type_id": "simple", "sku": "WSH-MAP001", "price": "149.0000", "name": "Flow Cell Wash Kit (R9)", "product_parameters": [] }, "4": { "entity_id": "4", "type_id": "simple", "sku": "FLO-MAP003", "price": "1800.0000", "name": "MinION Flow Cells", "product_parameters": [] }, "5": { "entity_id": "5", "type_id": "simple", "sku": "MIN-101B", "price": "1000.0000", "name": "MinION Sequencing Device", "product_parameters": [] }, "6": { "entity_id": "6", "type_id": "simple", "sku": "MinMAPDEP", "price": "1000.0000", "name": "MAP Deposit", "product_parameters": [] }, "8": { "entity_id": "8", "type_id": "bundle", "sku": "StdKit", "price": "3145.0000", "name": "Standard Experimental Kit", "product_parameters": [] }, "16": { "entity_id": "16", "type_id": "simple", "sku": "DEV-MAP004", "price": "249.0000", "name": "PCR Barcoding Kit", "product_parameters": [] }, "19": { "entity_id": "19", "type_id": "bundle", "sku": "StdKitNEW", "price": "2548.0000", "name": "Standard Experimental Kit - Contains one Pack of Flow Cells, one Nanopore Sequencing Kit and a Wash Kit.", "product_parameters": [] }, "20": { "entity_id": "20", "type_id": "simple", "sku": "SQK-MAP005", "price": "599.0000", "name": "Nanopore Sequencing Kit", "product_parameters": [] }, "21": { "entity_id": "21", "type_id": "simple", "sku": "MinMAPFee", "price": "1000.0000", "name": "MinION Mk 1B – New User Starter Pack", "product_parameters": [] }, "22": { "entity_id": "22", "type_id": "simple", "sku": "EXP-PBC001", "price": "288.0000", "name": "PCR Barcoding Expansion 1-12", "product_parameters": [] } }';
        Map<String,DataWrapper> prMap=(Map<String,DataWrapper>)JSON.deserialize(prInput, Map<String,DataWrapper>.class);
        System.debug('Map of products'+prMap);
        System.debug('3rd one'+ prMap.values() );
        List<DataWrapper> wrapperList=new List<DataWrapper>();
        wrapperList=prMap.values();
        System.debug('List of Data '+wrapperList[0]);
        return JSON.serialize(wrapperList) ;
    }
    public class DataWrapper {
        public String dataSku {get;set;}
        public String entity_id {get; set;}
        //  public List<Object> product_parameters {get; set;}
        public String type_id {get; set;}
        public String sku {get; set;}
        public Decimal price {get; set;}
        public String name {get; set;}
    }
}
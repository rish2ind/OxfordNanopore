import { LightningElement, wire } from 'lwc';
import getProducts from '@salesforce/apex/JsonParser.getProducts';





export default class ProductDetails extends LightningElement {
   
    testing = [];
    selectedProducts = [];
    @wire(getProducts)
    wiredProducts({data, error}){
        if(data){
            this.testing = data;
            
            
            
            console.log('This is my data : ' + JSON.parse(this.testing));
            this.testing=JSON.parse(this.testing);
            console.log('Test data 1',this.testing[0]);
            
        }
    }
    handleClick(event){
      
     //  console.log(this.testing);
       //console.log(this.testing[event.target.dataset.id].name);
       var product = this.testing[event.target.dataset.id].name;
        // var x = this.template.querySelector('.add');
        // var y = this.template.querySelector('.remove');
        // if(event.template.label == 'Add'){
        //     this.selectedProducts.push(product);
        // }
        // console.log(this.selectedProducts);
       // console.log(event.target.label);
       console.log(product);
       var label = event.target.label;
       if(label == 'Add'){
           console.log('Add');
           
           this.selectedProducts.push(product);

           console.log('This is selected product : ' , this.selectedProducts);
       }
       else{
           console.log('Remove');
            const index = this.selectedProducts.indexOf(product);
            if(index > -1){
                this.selectedProducts.splice(index, 1);
            }
        //   this.selectedProducts.splice(event.target.dataset.id, 1);
           console.log('This is current list : ' , this.selectedProducts);
       }
       
        var x=this.template.querySelectorAll(".add");
        var y=this.template.querySelectorAll(".remove");
        x.forEach(function(element){
            
            y.forEach(function(yElement){
            
                if(element.name==event.target.dataset.id){
                    
                    if(yElement.name == event.target.dataset.id){
                        
                        if(yElement.style.display === 'block'){
                            yElement.style.display = 'none';
                            element.style.display = 'block';
                           // x.style.display = 'none';
                           console.log('Third condition !!!');
                            }
                            else{
                                yElement.style.display = 'block';
                               
                            element.style.display = 'none';
                            console.log('This is else');
                            } 
                    }
                    
                    }
                
            }, this);
            
        },this);
       
    }
}
import AppForm from '../app-components/Form/AppForm';

Vue.component('bus-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                license_plate:  '' ,
                brand_id:  '' ,
                driver_id:  '' ,

                brand: '',
                driver: ''
                
            }
        }
    }

});
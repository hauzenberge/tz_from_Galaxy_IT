import AppForm from '../app-components/Form/AppForm';

Vue.component('car-brand-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                name:  '' ,
                
            }
        }
    }

});
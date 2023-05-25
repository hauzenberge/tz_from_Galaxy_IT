import AppForm from '../app-components/Form/AppForm';

Vue.component('driver-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                admin_user_id:  '' ,
                birthday:  '' ,
                
                adminUser: ''
            }
        }
    }

});
import AppListing from '../app-components/Listing/AppListing';

Vue.component('bus-listing', {
    mixins: [AppListing],

    data() {
        return {
            showBrandsFilter: true,
            brandsMultiselect: {},

            showDriversFilter: true,
            driversMultiselect: {},

            filters: {
                brands: [],

                drivers: [],
            },
        }
    },

    watch: {
        showBrandsFilter: function (newVal, oldVal) {
            this.brandsMultiselect = [];
        },
        brandsMultiselect: function (newVal, oldVal) {
            console.log(newVal);
            this.filters.brands = newVal.map(function (object) { return object['id']; });
            this.filter('brand_id', this.filters.brands);
        },

        showDriversFilter: function (newVal, oldVal) {
            this.driversMultiselect = [];
        },
        driversMultiselect: function(newVal, oldVal) {
            this.filters.drivers = newVal.map(function(object) { return object['id']; });
            this.filter('driver_id', this.filters.drivers);
        }
    }
});
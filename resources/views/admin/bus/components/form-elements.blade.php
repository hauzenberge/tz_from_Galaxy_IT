<div class="form-group row align-items-center" :class="{'has-danger': errors.has('license_plate'), 'has-success': fields.license_plate && fields.license_plate.valid }">
    <label for="license_plate" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.bus.columns.license_plate') }}</label>
    <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <input type="text" v-model="form.license_plate" v-validate="'required'" @input="validate($event)" class="form-control" :class="{'form-control-danger': errors.has('license_plate'), 'form-control-success': fields.license_plate && fields.license_plate.valid}" id="license_plate" name="license_plate" placeholder="{{ trans('admin.bus.columns.license_plate') }}">
        <div v-if="errors.has('license_plate')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('license_plate') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('brand'), 'has-success': fields.brand && fields.brand.valid }">
    <label for="brand" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.bus.columns.brand_id') }}</label>
    <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <multiselect v-model="form.brand" :options="{{ $brands->toJson() }}" placeholder="Select Brand" label="name" track-by="id" :multiple="true"></multiselect>
        <div v-if="errors.has('brand')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('brand') }}</div>
    </div>
</div>

<div class="form-group row align-items-center" :class="{'has-danger': errors.has('driver'), 'has-success': fields.driver && fields.driver.valid }">
    <label for="driver" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.bus.columns.driver_id') }}</label>
    <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        
        <multiselect 
        v-model="form.driver" 
        :options="{{ $drivers->toJson() }}" 
        placeholder="Select Driver" 
        label="name" 
        track-by="id" 
        :multiple="true"></multiselect>  
        
        <div v-if="errors.has('driver')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('driver') }}</div>
    </div>
</div>
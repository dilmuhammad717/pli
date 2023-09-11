import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log("Hello hello");
  }

  validate_name(e){
    let name = e.target.value;
    let max_length = e.target.dataset.maxLength;
    let error_container = e.target.dataset.errorDiv;
    if(name.length === 0)
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "can't be blank", error_container );
    else if(name.length > max_length)
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "too long (maximum is "+max_length+" characters)", error_container );
    else
      this.update_validation_field(
          e.target, 'border-gray-200', 'border-red-200',
          "", error_container );
  }

  validate_email(e){
    let email = e.target.value;
    let mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    let error_container = e.target.dataset.errorDiv;
    if(email.length === 0)
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "can't be blank", error_container );
    else if(email.match(mailFormat))
      this.update_validation_field(
          e.target, 'border-gray-200', 'border-red-200',
          "", error_container );
    else
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "invalid email address", error_container );
  }

  validate_phone(e){
    let phone = e.target.value;
    phone = phone.replace(/\D+/g, '');
    let error_container = e.target.dataset.errorDiv;
    if(phone.length === 0)
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "can't be blank", error_container );
    else if(phone.length < 10)
      this.update_validation_field(
          e.target, 'border-red-200', 'border-gray-200',
          "invalid phone number", error_container );
    else
      this.update_validation_field(
          e.target, 'border-gray-200', 'border-red-200',
          "", error_container );
    e.target.value = this.format_phone(phone)
  }

  format_phone(phone){
    let formatted_phone = phone.substr(0, 3);
    if(phone.length > 3){
      formatted_phone = formatted_phone + '-' + phone.substr(3, 3);
    }
    if(phone.length > 6){
      formatted_phone = formatted_phone + '-' + phone.substr(6, 4);
    }
    return formatted_phone
  }

  update_validation_field(field, class_to_add, class_to_remove, message, error_container){
    field.classList.remove(class_to_remove);
    field.classList.add(class_to_add);
    document.getElementById(error_container).textContent = message
    this.update_save_btn();
  }

  add_employment_fields(e){
    e.preventDefault();
    let regexp, time;
    time = new Date().getTime();
    regexp = new RegExp(e.target.dataset.id, 'g');
    let div = document.getElementById( 'employments' );
    div.insertAdjacentHTML( 'beforeend', e.target.dataset.fields.replace(regexp, time) );
    this.update_save_btn();
  }

  validate_field(e){
    let field = e.target;
    if(field.value.length === 0) {
      field.classList.remove('border-gray-200');
      field.classList.add('border-red-200');
      field.closest('.my-5').querySelector(".error").textContent = "can't be blank";
    } else {
      field.classList.remove('border-red-200');
      field.classList.add('border-gray-200');
      field.closest('.my-5').querySelector(".error").textContent = "";
    }
    this.update_save_btn();
  }

  update_save_btn(){
    let error_fields = document.getElementsByClassName('border-red-200');
    let submit_btn = document.querySelector('input[type="submit"]' );
    let all_required_filled = true
    document.querySelectorAll('input[required]').forEach(
        field => {if( field.value.length === 0 ){ all_required_filled = false }}
    )
    if(error_fields.length === 0 && all_required_filled) {
      submit_btn.classList.remove('bg-gray-400');
      submit_btn.classList.add('bg-blue-600');
      submit_btn.disabled = false;
    }else{
      submit_btn.classList.remove('bg-blue-600');
      submit_btn.classList.add('bg-gray-400');
      submit_btn.disabled = true;
    }
  }
}

import { extend } from 'vee-validate';

extend('required', {
  validate (value) {
    return {
      required: true,
      valid: ['', null, undefined].indexOf(value) === -1
    };
  },
  message: "Pole jest wymagane",
  computesRequired: true
});
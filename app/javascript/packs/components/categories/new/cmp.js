import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required } from 'vee-validate/dist/rules';

extend('required', {
  ...required,
  message: 'Pole jest wymagane'
});

export default {
	components: {
		ValidationProvider,
		ValidationObserver
	},

	data: function() {
		return {
			title: "",
			categoryError: false
		}
	},

	methods: {
		addCategory() {
			this.axios.post("categories", {
				category: {
					title: this.title
				}
			}).then(response => {
				this.$router.push("/categories")
			}).catch(error => {
				this.questionError = true
			})
		}
	}
}
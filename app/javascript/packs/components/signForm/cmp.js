import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, confirmed } from 'vee-validate/dist/rules';

extend('required', {
  ...required,
  message: 'Pole jest wymagane'
});

extend('confirmed', {
  ...confirmed,
  message: 'Pola nie są takie same'
});


export default {
	components: {
		ValidationProvider,
		ValidationObserver
	},
	data: function () {
		return {
			login: "",
			password: "",
			passwordConfirmation: "",
			loginError: false,
			signInForm: false
		}
	},
	
	methods: {
		signIn() {
			this.axios.post("signin", {
				auth: {
					name: this.login,
					password: this.password
				}
			}).then(response => {
				localStorage.jwt = response.data.jwt
				this.$router.push("/categories")
			}).catch(error => {
				console.log(error)
				if (error.response.status == 404) {
					this.loginError = true
				}
			})
		},

		signUp() {
			this.axios.post("signup", {
				user: {
					name: this.login,
					password: this.password,
					password_confirmation: this.passwordConfirmation
				}
			}).then(response => {
				this.signInForm = true
			}).catch(error => {
				console.log(error.response.data)
			})
		}
	}
}
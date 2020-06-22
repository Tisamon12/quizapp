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
			question: "",
			answers: [null, null, null, null],
			correctAnswerIndex: 0,
			questionError: false
		}
	},

	methods: {
		addQuestion() {
			this.axios.post(`categories/${this.$route.params.id}/questions`, {
				question: {
					content: this.question,
					answers: this.answers,
					correct_answer: this.answers[this.correctAnswerIndex]
				}
			}).then(response => {
				this.$router.push("/categories")
			}).catch(error => {
				this.questionError = true
			})
		}
	}
}
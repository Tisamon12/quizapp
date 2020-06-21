export default {
	data: function() {
		return {
			gameStarted: false,
			questions: [],
			currentQuestion: {},
			currentQuestionIndex: 0,
			timer: {},
			timeLeft: 0,
			correctAnswers: 0,
			showScore: false
		}
	},

	methods: {
		getQuestions() {
			this.gameStarted = true
			this.showScore = false
			this.axios.get(`categories/${this.$route.params.id}/get_questions`).then(response => {
				this.questions = response.data.questions
				this.currentQuestion = this.questions[0]
				this.correctAnswers = 0
				this.play()
			})
		},

		play() {
			this.timeLeft = 100
			if (this.currentQuestionIndex < 5) {
				console.log(this.currentQuestion.content)
				this.timer = setInterval(() => {
					this.timeLeft -= 10
					console.log(this.timeLeft)
					if (this.timeLeft == 0) {
						clearInterval(this.timer)
						this.currentQuestionIndex += 1
						this.currentQuestion = this.questions[this.currentQuestionIndex]
						this.play()
					}
				}, 1000)
			} else {
				this.endGame()
			}
		},

		sendAnswer(answer) {
			this.axios.post(`questions/${this.currentQuestion.id}/answer`, {
				answer: answer
			}).then(response => {
				clearInterval(this.timer)
				console.log("response.data.is_correct", response.data.is_correct)
				if (response.data.is_correct) this.correctAnswers += 1
				this.currentQuestionIndex += 1
				this.currentQuestion = this.questions[this.currentQuestionIndex]
				this.play()
			})
		},

		endGame() {
			this.currentQuestionIndex = 0
			this.gameStarted = false
			this.showScore = true
			console.log("ended")
			console.log(this.answers)
		}
	}
}
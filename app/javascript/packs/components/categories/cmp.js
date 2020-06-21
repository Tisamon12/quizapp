export default {
	data: function() {
		return {
			categories: []
		}
	},

	methods: {
		play(id) {
			this.$router.push(`/game/${id}`)
		}
	},

	mounted() {
		this.axios.get("categories").then(response => {
			this.categories = response.data.categories
		})
	}
}
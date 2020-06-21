export default {
	data: function() {
		return {
			categories: []
		}
	},

	methods: {
		play(id) {
			
		}
	},

	mounted() {
		this.axios.get("categories").then(response => {
			this.categories = response.data.categories
		})
	}
}
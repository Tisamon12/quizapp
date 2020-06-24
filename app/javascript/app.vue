<template lang="pug">
	v-app
		v-progress-linear(:active="loading" :indeterminate="loading" absolute color="primary")
		router-view
</template>

<script>
	export default {
		computed: {
			loading() {
				return this.$store.state.loading
			}
		}
	}
</script>